import 'package:dartz/dartz.dart';
import 'package:front/core/config/custom_interceptor.dart';
import 'package:front/core/project/data/data_sources/remote_data_source.dart';
import 'package:front/core/project/data/data_sources/temp_data_source.dart';
import 'package:front/core/project/data/models/project_request.dart';
import 'package:front/core/project/domain/entities/project_entity.dart';
import 'package:front/core/project/domain/repositories/project_repository.dart';
import 'package:front/core/utils/failure.dart';

class ProjectRepositoryImpl with ErrorHandler implements ProjectRepository {
  ProjectRepositoryImpl({
      required this.projectRemoteDataSource,
      required this.projectTempDataSource});
  final ProjectRemoteDataSource projectRemoteDataSource;
  final ProjectTempDataSource projectTempDataSource;

  Map<int, ProjectEntity> projects = {};

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjectsByTeamId(int teamId) async {
    return catchError<List<ProjectEntity>>(
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
  Future<Either<Failure, ProjectEntity>> getProjectById(int projectId) async {
    return catchError<ProjectEntity>(() async {
      var result = await projectRemoteDataSource.getProjectById(projectId);
      projects.addAll({projectId: result.toEntity()});
      return projects[projectId]!;
    });
  }

  @override
  Future<Either<Failure, void>> deleteProjectById(int projectId) async {
    return catchError<void>(() async {
      await projectRemoteDataSource.deleteProjectById(projectId);
      projects.remove(projectId);
      return;
    });
  }

  @override
  Future<Either<Failure, ProjectEntity>> updateProjectById(
      ProjectRequestModel project, int projectId) async {
    return catchError<ProjectEntity>(() async {
      var result =
          await projectRemoteDataSource.updateProjectById(project, projectId);
      projects.addAll({result.projectId: result.toEntity()});
      return result.toEntity();
    });
  }

  @override
  Future<Either<Failure, ProjectEntity>> createProject(
      ProjectRequestModel project, int teamId) async {
    return catchError<ProjectEntity>(() async {
      var result = await projectRemoteDataSource.createProject(project, teamId);
      projects.addAll({result.projectId: result.toEntity()});
      return result.toEntity();
    });
  }
}
