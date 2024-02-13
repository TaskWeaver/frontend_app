import 'package:dio/dio.dart';
import 'package:front/core/project/data/models/project.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjectsByTeamId(String teamId);
  Future<ProjectModel> getProjectById(String projectId);
  Future<ProjectModel> createProject(ProjectModel project);
  Future<ProjectModel> updateProject(ProjectModel project);
  Future<void> deleteProject(String projectId);

}

class ProjectRemoteDataSourceImpl extends ProjectRemoteDataSource {
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
  Future<ProjectModel> createProject(ProjectModel project) {
    // TODO: implement createProject
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteProject(String projectId) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }
  
  @override
  Future<ProjectModel> updateProject(ProjectModel project) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }
}
