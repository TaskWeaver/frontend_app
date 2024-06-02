import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:front/core/config/custom_interceptor.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/project/data/data_sources/remote_data_source.dart';
import 'package:front/features/project/data/data_sources/temp_data_source.dart';
import 'package:front/features/project/data/models/project_request_model.dart';
import 'package:front/features/project/entities/project.dart';
import 'package:front/features/project/repositories/project_repository.dart';

class ProjectRepositoryImpl with ErrorHandler implements ProjectRepository {
  ProjectRepositoryImpl(
      {required this.projectRemoteDataSource,
      required this.projectTempDataSource});
  final ProjectRemoteDataSource projectRemoteDataSource;
  final ProjectTempDataSource projectTempDataSource;

  Map<int, Project> projects = {};

  @override
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(int teamId) async {
    return catchError(() async {
      var result = await projectRemoteDataSource.getProjectsByTeamId(teamId);
      for (var element in result) {
        projects.addAll({element.projectId: element.toEntity()});
      }
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, Project>> getProjectById(int projectId) async {
    return catchError(() async {
      var result = await projectRemoteDataSource.getProjectById(projectId);
      projects.addAll({projectId: result.toEntity()});
      return projects[projectId]!;
    });
  }

  @override
  Future<Either<Failure, void>> deleteProjectById(int projectId) async {
    return catchError(() async {
      await projectRemoteDataSource.deleteProjectById(projectId);
      projects.remove(projectId);
    });
  }

  @override
  Future<Either<Failure, Project>> updateProjectById(
      Project project, int projectId) async {
    return catchError(() async {
      await projectRemoteDataSource.updateProjectById(
          ProjectRequestModel.fromEntity(project), projectId);
      projects.addAll({projectId: project});
      return project;
    });
  }

  @override
  Future<Either<Failure, Project>> createProject(
      ProjectRequestModel project, int teamId) async {
    return catchError(() async {
      var result = await projectRemoteDataSource.createProject(project, teamId);
      projects.addAll({result.projectId: result.toEntity()});
      return result.toEntity();
    });
  }
}
