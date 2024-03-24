import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/app/di/team_di.dart';
import 'package:front/core/team/data/data_source/team_remote_data_source.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/team/usecases/answer_to_invitation_usecase.dart';
import 'package:front/core/team/usecases/create_team_usecase.dart';
import 'package:front/core/team/usecases/delete_member_usecase.dart';
import 'package:front/core/team/usecases/get_team_by_id_usecase.dart';
import 'package:front/core/team/usecases/get_teams_use_case.dart';
import 'package:front/core/team/usecases/invitation_notification_usecase.dart';
import 'package:front/core/team/usecases/invite_team_by_email_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;
final teamRemoteDataSource = locator<TeamRemoteDataSource>();
final teamRepository = locator<TeamRepository>();

final getTeamsUseCase = locator<GetTeamsUseCase>();
final createTeamUseCase = locator<CreateTeamUseCase>();
final getTeamByIdUseCase = locator<GetTeamByIdUseCase>();

final answerToInvitationUseCase =  locator<AnswerToInvitationUseCase>();
final deleteMemberUseCase =  locator<DeleteMemberUseCase>();
final invitationNotificationUseCase = locator<InvitationNotificationUseCase>();
final inviteTeamByEmailUseCase = locator<InviteTeamByEmailUseCase>();

final getStorage = locator<FlutterSecureStorage>();

initLocator() {
  TeamDependencyInjection().init();
}
