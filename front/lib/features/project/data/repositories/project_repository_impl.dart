import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/data_sources/remote_data_source.dart';
import 'package:front/features/project/data/data_sources/temp_data_source.dart';
import 'package:front/features/project/data/models/project_request.dart';
import 'package:front/features/project/entities/project.dart';
import 'package:front/features/project/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRepositoryImpl(
      {required this.projectRemoteDataSource,
      required this.projectTempDataSource});
  final ProjectRemoteDataSource projectRemoteDataSource;
  final ProjectTempDataSource projectTempDataSource;

  Map<int, Project> projects = {};

  @override
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(int teamId) async {
    try {
      var result = await projectRemoteDataSource.getProjectsByTeamId(teamId);
      for (var element in result) {
        projects.addAll({element.projectId: element.toEntity()});
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
  Future<Either<Failure, Project>> getProjectById(int projectId) async {
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
  Future<Either<Failure, void>> deleteProjectById(int projectId) async {
    try {
      await projectRemoteDataSource.deleteProjectById(projectId);
      projects.remove(projectId);
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Project>> updateProjectById(
      ProjectRequestModel project, int projectId) async {
    try {
      var result =
          await projectRemoteDataSource.updateProjectById(project, projectId);
      projects.addAll({result.projectId: result.toEntity()});
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Project>> createProject(
      ProjectRequestModel project, int teamId) async {
    try {
      var result = await projectRemoteDataSource.createProject(project, teamId);
      projects.addAll({result.projectId: result.toEntity()});
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    } on UnimplementedError {
      var result = await projectTempDataSource.createProject(project);
      return Right(result.toEntity());
    }
  }
}
