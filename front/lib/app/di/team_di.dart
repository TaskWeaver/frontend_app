import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/app/locator.dart';
import 'package:front/core/team/data/data_source/team_remote_data_source.dart';
import 'package:front/core/team/data/data_source/team_remote_data_source_impl.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/team/repositories/team_repository_impl.dart';
import 'package:front/core/team/usecases/create_team_usecase.dart';
import 'package:front/core/team/usecases/get_team_by_id_usecase.dart';
import 'package:front/core/team/usecases/get_teams_use_case.dart';

class TeamDependencyInjection {
  void init() {
    dataSources();
    repositories();
    useCases();
    setupLocator();
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
      ..registerFactory<GetTeamByIdUseCase>(
        () => GetTeamByIdUseCase(
          teamRepository,
        ),
      )
      ..registerFactory<CreateTeamUseCase>(
        () => CreateTeamUseCase(
          teamRepository,
        ),
      );
  }

  void setupLocator() {
    locator.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  }
}
