import 'package:front/core/project/data/models/project.dart';

class ProjectTempDataSource {
  Future<List<ProjectModel>> getProjectsByTeamId(String teamId) async {
    var projectModelList = List.generate(
        3,
        (index) => ProjectModel(
              pro_id: 'pro_id$index',
              team_id: 'team_id$index',
              name: 'name$index',
              discription: 'description$index',
              created_at: DateTime(2020, 10, 10, 14, 58, 4),
              finished_at: DateTime(2020, 10, 10, 14, 58, 4),
              deleted_at: DateTime(2020, 10, 10, 14, 58, 4),
            ));
    // var projectsModel = ProjectsModel(values: projectModelList);
    return Future.delayed(
        const Duration(seconds: 3), () => Future.value(projectModelList));
  }
}
