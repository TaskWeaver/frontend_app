import 'package:flutter/material.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/team_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'board_view_model.g.dart';

@riverpod
class BoardViewModel extends _$BoardViewModel {
  @override
  //todo 로딩으로 바꾸기
  AsyncValue<List<TeamModel>> build() => const AsyncValue.loading();

  Future<void> getTeams() async {
    final response = await getTeamsUseCase.call();

    response.fold(
        onSuccess: (value) {
          debugPrint(value.result.runtimeType.toString());
          List<dynamic> teams = value.result;
          var teamList = teams
              .map((team) => TeamModel.fromJson(team as Map<String, dynamic>))
              .toList();

          state = AsyncValue.data(teamList);
          for (var team in teamList) {
            debugPrint('team: ${team.name}');
          }
        },
        onFailure: (e) => state = AsyncValue.error(e, StackTrace.current));
  }
}
