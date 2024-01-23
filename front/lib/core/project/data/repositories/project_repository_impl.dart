import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/data_sources/remote_data_source.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/entities/projects.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl({required this.projectRemoteDataSource});
  final ProjectRemoteDataSource projectRemoteDataSource;
  ProjectsEntity projects = const ProjectsEntity(values: []);

  @override
  Future<Either<Failure, ProjectsEntity>> getProjectsByTeamId(
      String teamId) async {
    try {
      var result = await projectRemoteDataSource.getProjectsByTeamId(teamId);
      projects = result.toEntity();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> getProjectById(
      String projectId) async {
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