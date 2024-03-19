import 'package:front/app/locator.dart';
import 'package:front/core/team/data/data_source/team_remote_data_source.dart';
import 'package:front/core/team/data/data_source/team_remote_data_source_impl.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/team/repositories/team_repository_impl.dart';
import 'package:front/core/team/usecases/create_team_usecase.dart';
import 'package:front/core/team/usecases/get_teams_use_case.dart';

class TeamDependencyInjection {
  void init() {
    dataSources();
    repositories();
    useCases();
  }

  void dataSources() {
    locator.registerLazySingleton<TeamRemoteDataSource>(
      TeamRemoteDataSourceImpl.new,
    );
  }

  void repositories() {
    locator.registerLazySingleton<TeamRepository>(
      () => TeamRepositoryImpl(
        teamRemoteDataSource: teamRemoteDataSource,
      ),
    );
  }

  void useCases() {
    locator
      ..registerFactory<GetTeamsUseCase>(
        () => GetTeamsUseCase(
          teamRepository,
        ),
      )
      ..registerFactory<CreateTeamUseCase>(
        () => CreateTeamUseCase(
          teamRepository,
        ),
      );
    // ..registerFactory(
    //       () => UpdateWrongAnswerUseCase(topicRepository),
    // )
    // ..registerFactory(
    //       () => GetWrongAnswersUseCase(topicRepository),
    // );
  }
}
