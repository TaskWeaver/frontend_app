import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/project/data/models/create_project_request.dart';
import 'package:front/features/project/data/models/project_model.dart';

abstract class ProjectRepository {
  Future<Result<ApiResponse<List<ProjectModel>>>> getProjectsByTeamId(
      int teamId);
  Future<Result<ApiResponse<ProjectModel>>> getProjectById(int projectId);
  Future<Result<ApiResponse<ProjectModel>>> createProject(
      CreateProjectRequest project, int teamId);
  Future<Result<ApiResponse<ProjectModel>>> updateProjectById(
      CreateProjectRequest project, int projectId);
  Future<Result<ApiResponse>> deleteProjectById(int projectId);
}
