import 'package:front/app/locator.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_team_project_list_provider.g.dart';

@riverpod
Future<List<ProjectModel>> selectedTeamProjectList(
  SelectedTeamProjectListRef ref,
  int teamId,
) async {
  var projects = await getProjectsByTeamIdUseCase.call(teamId);
  return projects.fold(
    onSuccess: (value) {
      var projectModels = <ProjectModel>[];
      for (var e in value.result) {
        if (e is Map<String, dynamic>) {
          projectModels.add(ProjectModel.fromJson(e));
        } else {
          print('Invalid data type in project list: $e');
        }
      }
      return projectModels;
    },
    onFailure: (e) => throw e,
  );
}
