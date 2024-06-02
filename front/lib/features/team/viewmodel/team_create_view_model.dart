import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/create_team_request_model.dart';
import 'package:front/features/team/data/models/create_team_response_model.dart';
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
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
