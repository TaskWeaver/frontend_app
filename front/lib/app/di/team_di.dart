import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/app/locator.dart';
import 'package:front/app/shared_preferences_service.dart';
import 'package:front/features/team/data/data_source/team_remote_data_source.dart';
import 'package:front/features/team/data/data_source/team_remote_data_source_impl.dart';
import 'package:front/features/team/repositories/team_repository.dart';
import 'package:front/features/team/repositories/team_repository_impl.dart';
import 'package:front/features/team/usecases/answer_to_invitation_usecase.dart';
import 'package:front/features/team/usecases/create_team_usecase.dart';
import 'package:front/features/team/usecases/delete_member_usecase.dart';
import 'package:front/features/team/usecases/get_team_by_id_usecase.dart';
import 'package:front/features/team/usecases/get_team_members_by_team_id_usecase.dart';
import 'package:front/features/team/usecases/get_teams_use_case.dart';
import 'package:front/features/team/usecases/invitation_notification_usecase.dart';
import 'package:front/features/team/usecases/invite_team_by_email_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      )
      ..registerFactory<DeleteMemberUseCase>(
        () => DeleteMemberUseCase(
          teamRepository,
        ),
      )
      ..registerFactory<InvitationNotificationUseCase>(
        () => InvitationNotificationUseCase(
          teamRepository,
        ),
      )
      ..registerFactory<InviteTeamByEmailUseCase>(
        () => InviteTeamByEmailUseCase(
          teamRepository,
        ),
      )
      ..registerFactory<AnswerToInvitationUseCase>(
        () => AnswerToInvitationUseCase(
          teamRepository,
        ),
      )
      ..registerFactory<GetTeamMembersByTeamIdUseCase>(
        () => GetTeamMembersByTeamIdUseCase(
          teamRepository,
        ),
      );
  }

  Future<void> setupLocator() async {
    locator
        .registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
    locator.registerSingletonAsync<SharedPreferences>(
        () => SharedPreferences.getInstance());
    locator.registerFactory<SharedPreferencesService>(
        () => SharedPreferencesService());
  }
}
