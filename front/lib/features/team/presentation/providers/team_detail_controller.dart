import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/team_detail.dart';
import 'package:front/features/team/presentation/pages/team/team_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_detail_controller.g.dart';

@riverpod
class TeamDetailController extends _$TeamDetailController {
  @override
  TeamState build() => const TeamState.loading();

  Future<void> getTeamById(int teamId) async {
    final response = await getTeamByIdUseCase.call(teamId: teamId);
    return response.fold(
      onSuccess: (value) => state =
          TeamState<TeamDetailModel>(TeamDetailModel.fromJson(value.result)),
      onFailure: (e) =>
      state = TeamState<TeamDetailModel>.error(message: e.toString()),
    );
  }
}