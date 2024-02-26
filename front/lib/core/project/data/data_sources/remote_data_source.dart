import 'package:dio/dio.dart';
import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/data/models/project_create.dart';
import 'package:front/core/utils/exception.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjectsByTeamId(int teamId);
  Future<ProjectModel> getProjectById(int projectId);
  Future<ProjectModel> createProject(ProjectCreateModel project);
  Future<ProjectModel> updateProject(ProjectModel project);
  Future<String> deleteProjectById(String projectId);
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  ProjectRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<ProjectModel>> getProjectsByTeamId(int teamId) async {
    try {
      var response = await dio.get(
        '/v1/projects/$teamId',
      );

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return response.data['result']
            .map<ProjectModel>((data) => ProjectModel.fromJson(data))
            .toList();
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<ProjectModel> getProjectById(int projectId) async {
    try {
      var response = await dio.get('/v1/project/$projectId');

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return ProjectModel.fromJson(response.data['result']);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<ProjectModel> createProject(ProjectCreateModel project) {
    // TODO: implement createProject
    throw UnimplementedError();
  }

  @override
  Future<String> deleteProjectById(String projectId) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel> updateProject(ProjectModel project) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }
}
