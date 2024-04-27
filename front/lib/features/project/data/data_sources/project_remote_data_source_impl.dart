import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/features/project/data/api/project_api.dart';
import 'package:front/features/project/data/data_sources/project_remote_data_sources.dart';
import 'package:front/features/project/data/models/create_project_request.dart';
import 'package:front/features/project/data/models/project_model.dart';

final class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final ProjectAPI _ProjectAPI = ProjectAPI(
    AppDio.instance,
    baseUrl:
        'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083/v1',
  );

  @override
  Future<ApiResponse<ProjectModel>> createProject(
      CreateProjectRequest project, int teamId) {
    return _ProjectAPI.createProejcet(
        createProjectRequest: project, teamId: teamId);
  }

  @override
  Future<ApiResponse> deleteProjectById(int projectId) {
    return _ProjectAPI.deleteProjectById(projectId: projectId);
  }

  @override
  Future<ApiResponse<ProjectModel>> getProjectById(int projectId) {
    return _ProjectAPI.getProjectById(projectId: projectId);
  }

  @override
  Future<ApiResponse<List<ProjectModel>>> getProjectsByTeamId(int teamId) {
    return _ProjectAPI.getProjectsByTeamId(teamId: teamId);
  }

  @override
  Future<ApiResponse<ProjectModel>> updateProjectById(
      CreateProjectRequest project, int projectId) {
    return _ProjectAPI.updateProjectById(
        projectId: projectId, projectRequest: project);
  }
}
