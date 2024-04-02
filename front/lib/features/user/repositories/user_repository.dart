import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data_sources/local_data_source.dart';
import 'package:front/features/user/data_sources/remote_data_source.dart';
import 'package:front/features/user/entity/token.dart';
import 'package:front/features/user/models/user.dart';

abstract class UserRepository {
  /// 사용자 정보, 토큰 ,로그인 여부 등을 저장하는 리포지토리
  ///RemoteDataSource에서 받아온 데이터를 Either로 감싸서 반환
  Future<Either<Failure, UserModel>> getRemoteUserInfo();
  Future<Either<Failure, UserModel>> saveUserInfo(UserModel userModel);
  Future<Either<Failure, UserModel?>> getLocalUserInfo();
  Future<Either<Failure, bool>> clearUserInfo();
  Future<Either<Failure, Token>> saveToken(Token token);
  Future<Either<Failure, Token>> getToken();
  Future<Either<Failure, bool>> clearToken();
}

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  @override
  Future<Either<Failure, UserModel>> getRemoteUserInfo() async {
    try {
      var result = await userRemoteDataSource.getMe();
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
  Future<Either<Failure, UserModel?>> getLocalUserInfo() async {
    try {
      var result = await userLocalDataSource.getUserInfo();
      return Right(result);
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    } on UnimplementedError {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, Token>> saveToken(Token token) async {
    try {
      await userLocalDataSource.saveToken(token);
      return Right(token);
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    } on UnimplementedError {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, Token>> getToken() async {
    try {
      var result = await userLocalDataSource.getToken();
      if (result != null) {
        return Right(result);
      } else {
        return const Left(DatabaseFailure('An error has occurred'));
      }
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    } on UnimplementedError {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> saveUserInfo(UserModel userModel) async {
    try {
      var result = await userLocalDataSource.saveUserInfo(userModel);
      return Right(result);
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    } on UnimplementedError {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, bool>> clearUserInfo() async {
    try {
      var result = await userLocalDataSource.clearUserInfo();
      return Right(result);
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    } on UnimplementedError {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, bool>> clearToken() async {
    try {
      var result = await userLocalDataSource.clearToken();
      return Right(result);
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    } on UnimplementedError {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }
}
