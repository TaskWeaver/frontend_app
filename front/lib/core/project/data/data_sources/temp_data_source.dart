import 'package:front/core/project/data/models/project.dart';
import 'package:front/core/project/data/models/project_request.dart';

class ProjectTempDataSource {
  Future<List<ProjectModel>> getProjectsByTeamId(int teamId) async {
    var projectModelList = List.generate(
        3,
        (index) => ProjectModel(
              projectId: index,
              name: 'name$index',
              description: 'description$index',
              managerId: index + 1,
              projectState: 'BEFORE',
            ));
    // var projectsModel = ProjectsModel(values: projectModelList);
    return Future.delayed(
        const Duration(seconds: 3), () => Future.value(projectModelList));
  }

  Future<ProjectModel> createProject(ProjectRequestModel project) async {
    var projectModel = ProjectModel(
      projectId: 1,
      name: 'name1',
      description: 'description1',
      managerId: 2,
      projectState: 'BEFORE',
    );
    // var projectsModel = ProjectsModel(values: projectModelList);
    return Future.delayed(
        const Duration(seconds: 2), () => Future.value(projectModel));
  }
}
