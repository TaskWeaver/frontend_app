import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/project/data/data_sources/project_remote_data_sources.dart';
import 'package:front/features/project/data/models/create_project_request.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:front/features/project/data/repositories/project_repositories.dart';

final class ProjectRepositoryImpl implements ProjectRepository {
  const ProjectRepositoryImpl({
    required ProjectRemoteDataSource projectRemoteDataSource,
  }) : _projectRemoteDataSource = projectRemoteDataSource;

  final ProjectRemoteDataSource _projectRemoteDataSource;

  @override
  Future<Result<ApiResponse<ProjectModel>>> createProject(
      CreateProjectRequest project, int teamId) async {
    try {
      var result =
          await _projectRemoteDataSource.createProject(project, teamId);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse>> deleteProjectById(int projectId) async {
    try {
      var result = await _projectRemoteDataSource.deleteProjectById(projectId);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<ProjectModel>>> getProjectById(
      int projectId) async {
    try {
      var result = await _projectRemoteDataSource.getProjectById(projectId);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<List<ProjectModel>>>> getProjectsByTeamId(
      int teamId) async {
    try {
      var result = await _projectRemoteDataSource.getProjectsByTeamId(teamId);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<ProjectModel>>> updateProjectById(
      CreateProjectRequest project, int projectId) async {
    try {
      var result =
          await _projectRemoteDataSource.updateProjectById(project, projectId);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
