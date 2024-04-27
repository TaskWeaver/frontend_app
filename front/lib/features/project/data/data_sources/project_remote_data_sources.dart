import 'package:front/core/utils/api_response.dart';
import 'package:front/features/project/data/models/create_project_request.dart';
import 'package:front/features/project/data/models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<ApiResponse<List<ProjectModel>>> getProjectsByTeamId(int teamId);
  Future<ApiResponse<ProjectModel>> getProjectById(int projectId);
  Future<ApiResponse<ProjectModel>> createProject(
      CreateProjectRequest project, int teamId);
  Future<ApiResponse<ProjectModel>> updateProjectById(
      CreateProjectRequest project, int projectId);
  Future<ApiResponse> deleteProjectById(int projectId);
}
