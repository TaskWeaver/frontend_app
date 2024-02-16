import 'package:dio/dio.dart';
import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/data/models/project_create.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjectsByTeamId(String teamId);
  Future<ProjectModel> getProjectById(String projectId);
  Future<ProjectModel> createProject(ProjectCreateModel project);
  Future<ProjectModel> updateProject(ProjectModel project);
  Future<String> deleteProjectById(String projectId);

}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
    ProjectRemoteDataSourceImpl({required this.dio});
    final Dio dio;

  @override
  Future<List<ProjectModel>> getProjectsByTeamId(String teamId) async {
    // TODO: implement getProjectsByTeamId
    throw UnimplementedError();
  }
  
  @override
  Future<ProjectModel> getProjectById(String projectId) {
    // TODO: implement getProjectById
    throw UnimplementedError();
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
