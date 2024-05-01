import 'package:front/features/project/data/models/project_model.dart';
import 'package:front/features/project/usecases/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_team_project_list_provider.g.dart';

@riverpod
Future<List<ProjectModel>> selectedTeamProjectList(
  SelectedTeamProjectListRef ref,
  int teamId,
) async {
  var projects =
      await ref.read(getProjectsByTeamIdUseCaseProvider).call(teamId);
  return projects.fold(
    (failure) => throw failure,
    (result) => result.map((e) => ProjectModel.fromEntity(e)).toList(),
  );
}
