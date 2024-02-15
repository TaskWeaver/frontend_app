import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:front/core/Auth/data_sources/remote_data_source.dart';
import 'package:front/core/Auth/models/user.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';

abstract class AuthRepository {
  /// 사용자 정보, 토큰 ,로그인 여부 등을 저장하는 리포지토리
  ///RemoteDataSource에서 받아온 데이터를 Either로 감싸서 반환
  Future<Either<Failure, UserRegistrationResponse>> signUp(
      UserRegistrationRequest userRegistrationRequest);
  Future<Either<Failure, UserModel>> signIn(
      {required String email, required String password});
  Future<Either<Failure, UserModel>> getMe();
  //TODO : 토큰 재발급 로직 추가
  //Future<Either<Failure, TokenResponse>> token();
}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.authRemoteDataSource});
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<Failure, UserRegistrationResponse>> signUp(
      UserRegistrationRequest userRegistrationRequest) async {
    try {
      var result = await authRemoteDataSource.signUp(userRegistrationRequest);
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
  Future<Either<Failure, UserModel>> signIn(
      {required String email, required String password}) async {
    try {
      var responseResult = await authRemoteDataSource.signIn(email, password);
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
  Future<Either<Failure, UserModel>> getMe() async {
    try {
      var responseResult = await authRemoteDataSource.getMe();
      return Right(responseResult);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    } on UnimplementedError {
      return const Left(ServerFailure('An error has occurred'));
    }
  }
}
