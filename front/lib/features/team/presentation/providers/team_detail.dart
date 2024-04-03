
import 'package:front/features/project/usecases/riverpod.dart';
import 'package:front/features/team/presentation/providers/projects_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_detail.g.dart';

@riverpod
class TeamDetailViewmodel extends _$TeamDetailViewmodel {
  @override
  ProjectsState build() => const ProjectsState.loading();

  Future<void> getProjectsByTeamId(int teamId) async {
    var result = await ref.read(getProjectsByTeamIdUseCaseProvider)(teamId);
    result.fold(
      (l) => state = ProjectsState.error(message: l.message),
      (r) => state = ProjectsState(r),
    );
  }
}
