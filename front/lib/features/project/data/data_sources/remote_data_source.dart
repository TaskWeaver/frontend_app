import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front/core/network_handling/app_dio.dart';

import 'package:front/core/utils/exception.dart';
import 'package:front/features/project/data/models/project.dart';
import 'package:front/features/project/data/models/project_request.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjectsByTeamId(int teamId);
  Future<ProjectModel> getProjectById(int projectId);
  Future<ProjectModel> createProject(ProjectRequestModel project, int teamId);
  Future<ProjectRequestModel> updateProjectById(
      ProjectRequestModel project, int projectId);
  Future<void> deleteProjectById(int projectId);
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  ProjectRemoteDataSourceImpl();
  final Dio dio = AppDio.instance;

  @override
  Future<List<ProjectModel>> getProjectsByTeamId(int teamId) async {
    try {
      dio.options.headers = {'accessToken': 'true'};
      debugPrint('teamId: $teamId');
      var response = await dio.get(
        '/v1/team/$teamId/projects',
      );

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        debugPrint(response.data['result'].toString());
        return response.data['result']
            .map<ProjectModel>((data) => ProjectModel.fromJson(data))
            .toList();
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ProjectModel> getProjectById(int projectId) async {
    try {
      dio.options.headers = {'accessToken': 'true'};
      var response = await dio.get('/v1/project/$projectId');

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return ProjectModel.fromJson(response.data['result']);
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ProjectModel> createProject(
      ProjectRequestModel project, int teamId) async {
    try {
      dio.options.headers = {'accessToken': 'true'};
      var response = await dio.post(
        '/v1/team/$teamId/project',
        data: project.toJson(),
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );
      if (response.statusCode == 201 && response.data?['resultCode'] == 201) {
        return ProjectModel.fromJson(response.data['result']);
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<void> deleteProjectById(int projectId) async {
    try {
      dio.options.headers = {'accessToken': 'true'};
      var response = await dio.delete('/v1/project/$projectId');

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return;
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ProjectRequestModel> updateProjectById(
      ProjectRequestModel project, int projectId) async {
    try {
      dio.options.headers = {'accessToken': 'true'};
      var response = await dio.patch(
        '/v1/project/$projectId',
        data: project.toJson(),
      );

      if (response.statusCode == 204 && response.data?['resultCode'] == 204) {
        return project;
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }
}
