import 'package:front/app/locator.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_detail_viewmodel.g.dart';

@riverpod
class ProjectDetailViewModel extends _$ProjectDetailViewModel {
  @override
  AsyncValue<ProjectModel> build() => const AsyncValue.loading();

  Future<void> loadProjectDetail(int projectId) async {
    final response = await getProjectByIdUseCase.call(projectId);
    response.fold(onSuccess: (value) {
      state = AsyncValue.data(
          ProjectModel.fromJson(value.result as Map<String, dynamic>));
    }, onFailure: (e) {
      state = AsyncValue.error(e, StackTrace.current);
    });
  }
}
/* import 'package:flutter/material.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/team_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'board_view_model.g.dart';

@riverpod
class BoardViewModel extends _$BoardViewModel {
  @override
  Future<List<TeamModel>> build() async => [];

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
 */