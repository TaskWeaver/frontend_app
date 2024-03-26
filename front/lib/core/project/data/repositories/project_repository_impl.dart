import 'package:dartz/dartz.dart';
import 'package:front/core/config/custom_interceptor.dart';
import 'package:front/core/project/data/data_sources/remote_data_source.dart';
import 'package:front/core/project/data/data_sources/temp_data_source.dart';
import 'package:front/core/project/data/models/project_request.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class ProjectRepositoryImpl with ErrorHandler implements ProjectRepository {
  ProjectRepositoryImpl(
      {required this.projectRemoteDataSource,
      required this.projectTempDataSource});
  final ProjectRemoteDataSource projectRemoteDataSource;
  final ProjectTempDataSource projectTempDataSource;

  Map<int, Project> projects = {};

  @override
  Future<Either<Failure, List<Project>>> getProjectsByTeamId(int teamId) async {
    return catchError<List<Project>>(
      () async {
        var result = await projectRemoteDataSource.getProjectsByTeamId(teamId);
        for (var element in result) {
          projects.addAll({element.projectId: element.toEntity()});
        }
        return result.map((e) => e.toEntity()).toList();
      },
    );
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
      return;
    });
  }

  @override
  Future<Either<Failure, Project>> updateProjectById(
      ProjectRequestModel project, int projectId) async {
    return catchError(() async {
      var result =
          await projectRemoteDataSource.updateProjectById(project, projectId);
      projects.addAll({result.projectId: result.toEntity()});
      return result.toEntity();
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
