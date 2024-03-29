import 'package:dio/dio.dart';

import 'package:front/core/utils/exception.dart';
import 'package:front/features/project/data/models/project.dart';
import 'package:front/features/project/data/models/project_request.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjectsByTeamId(int teamId);
  Future<ProjectModel> getProjectById(int projectId);
  Future<ProjectModel> createProject(ProjectRequestModel project, int teamId);
  Future<ProjectModel> updateProjectById(
      ProjectRequestModel project, int projectId);
  Future<void> deleteProjectById(int projectId);
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
  Future<ProjectModel> createProject(
      ProjectRequestModel project, int teamId) async {
    try {
      var response =
          await dio.put('/v1/project/$teamId', data: project.toJson());
      if (response.statusCode == 200 && response.data?['resultCode'] == 201) {
        return ProjectModel.fromJson(response.data['result']);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProjectById(int projectId) async {
    try {
      var response = await dio.delete('/v1/project/$projectId');

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return;
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<ProjectModel> updateProjectById(
      ProjectRequestModel project, int projectId) async {
    try {
      var response =
          await dio.patch('/v1/project/$projectId', data: project.toJson());

      if (response.statusCode == 200 && response.data?['resultCode'] == 204) {
        return ProjectModel.fromJson(response.data['result']);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}
