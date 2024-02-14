import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:front/core/project/data/data_sources/remote_data_source.dart';
import 'package:front/core/project/data/data_sources/temp_data_source.dart';
import 'package:front/core/project/data/models/project.dart';
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

  Map<String, Project> projects = {};

  @override
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(
      String teamId) async {
    try {
      var result = await projectRemoteDataSource.getProjectsByTeamId(teamId);
      for (var element in result) {
        projects.addAll({element.pro_id: element.toEntity()});
      }
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
      projects.addAll({projectId: result.toEntity()});
      return Right(projects[projectId]!);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProjectById(String projectId) async {
    try {
      var result = await projectRemoteDataSource.deleteProjectById(projectId);
      projects.remove(result);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Project>> updateProject(Project project) async {
    try {
      var result = await projectRemoteDataSource
          .updateProject(ProjectModel.fromEntity(project));
      projects.addAll({result.pro_id: result.toEntity()});
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    }
  }
}
