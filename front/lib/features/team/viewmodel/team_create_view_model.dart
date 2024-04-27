import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/create_team_request.dart';
import 'package:front/features/team/data/models/create_team_response.dart';
import 'package:front/features/team/viewmodel/board_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_create_view_model.g.dart';

@riverpod
class TeamCreateViewModel extends _$TeamCreateViewModel {
  @override
  Future<CreateTeamResponse?> build() async => null;

  Future<void> createTeam(
      {required CreateTeamRequest createTeamRequest}) async {
    state = const AsyncValue.loading();
    final response =
        await createTeamUseCase.call(createTeamRequest: createTeamRequest);

    response.fold(
        onSuccess: (value) {
          state = AsyncValue.data(CreateTeamResponse.fromJson(
              value.result as Map<String, dynamic>));
          ref.invalidate(boardViewModelProvider);
          ref.read(boardViewModelProvider.notifier).getTeams();
        },
        onFailure: (e) => state = AsyncValue.error(e, StackTrace.current));
  }
}
