import 'package:front/app/domain/presentation/team/state/projects_state.dart';
import 'package:front/core/project/domain/usecases/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_detail.g.dart';

@riverpod
class TeamDetailViewmodel extends _$TeamDetailViewmodel {
  @override
  ProjectsState build() => const ProjectsState.loading();

  Future<void> getProjectsByTeamId(String teamId) async {
    var result = await ref.read(getProjectsByTeamIdUseCaseProvider)(teamId);
    result.fold(
      (l) => state = ProjectsState.error(message: l.message),
      (r) => state = ProjectsState(r),
    );
  }
}
