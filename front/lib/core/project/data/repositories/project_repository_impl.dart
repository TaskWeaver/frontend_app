import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/data_sources/remote_data_source.dart';
import 'package:front/core/project/data/data_sources/temp_data_source.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl(
      {required this.projectRemoteDataSource,
      required this.projectTempDataSource});
  final ProjectRemoteDataSource projectRemoteDataSource;
  final ProjectTempDataSource projectTempDataSource;

  @override
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(String teamId) async {
    try {
      var result = await projectRemoteDataSource.getProjectsByTeamId(teamId);
      return Right(result.map((e) => e.toEntity()).toList());
      
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    } on UnimplementedError {
      var result = await projectTempDataSource.getProjectsByTeamId(teamId);
      return Right(result.map((e) => e.toEntity()).toList());
    }
  }

  @override
  Future<Either<Failure, Project>> getProjectById(String projectId) async {
    try {
      var result = await projectRemoteDataSource.getProjectById(projectId);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    }
  }
}
