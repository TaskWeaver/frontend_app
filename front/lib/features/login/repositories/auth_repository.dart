import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/login/data_sources/local_data_source.dart';
import 'package:front/features/login/data_sources/remote_data_source.dart';
import 'package:front/features/login/models/user.dart';

abstract class AuthRepository {
  /// 사용자 정보, 토큰 ,로그인 여부 등을 저장하는 리포지토리
  /// RemoteDataSource에서 받아온 데이터를 Either로 감싸서 반환
  Future<Either<Failure, UserRegistrationResponse>> signUp(
      UserRegistrationRequest userRegistrationRequest);
  Future<Either<Failure, LoginResponse>> signIn(
      {required String email, required String password});
  Future<Either<Failure, bool>> getAuthenticated();
  Future<Either<Failure, bool>> setAuthenticated(bool value);
  //TODO : 토큰 재발급 로직 추가
  //Future<Either<Failure, TokenResponse>> token();
}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
      {required this.userLocalDataSource, required this.userRemoteDataSource});
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  @override
  Future<Either<Failure, UserRegistrationResponse>> signUp(
      UserRegistrationRequest userRegistrationRequest) async {
    try {
      var result = await userRemoteDataSource.signUp(userRegistrationRequest);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    } on UnimplementedError {
      return const Left(ServerFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> signIn(
      {required String email, required String password}) async {
    try {
      var responseResult = await userRemoteDataSource.signIn(email, password);

      return Right(responseResult);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    } on UnimplementedError {
      return const Left(ServerFailure('An error has occurred'));
    }
  }
  //TODO : 토큰 재발급 로직 추가
  //  Future<Either<Failure, TokenResponse>> token() async{
  //   try {
  //     var responseResult = await authRemoteDataSource.token();
  //     var result = TokenResponse.fromJson(responseResult);
  //     return Right(result);
  //   } on ServerException {
  //     return const Left(ServerFailure('An error has occurred'));
  //   } on SocketException {
  //     return const Left(ServerFailure('Failed to connect to the network'));
  //   } on UnimplementedError {
  //     return const Left(ServerFailure('An error has occurred'));
  //   }
  //  }

  @override
  Future<Either<Failure, bool>> setAuthenticated(bool value) async {
    try {
      var result = await userLocalDataSource.setAuthenticated(value);
      return Right(result);
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    } on UnimplementedError {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, bool>> getAuthenticated() async {
    try {
      var result = await userLocalDataSource.getAuthenticated();
      return Right(result);
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    } on UnimplementedError {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }
}
