import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/app/di/team_di.dart';
import 'package:front/app/di/user_di.dart';
import 'package:front/app/shared_preferences_service.dart';
import 'package:front/features/team/data/data_source/team_remote_data_source.dart';
import 'package:front/features/team/repositories/team_repository.dart';
import 'package:front/features/team/usecases/answer_to_invitation_usecase.dart';
import 'package:front/features/team/usecases/create_team_usecase.dart';
import 'package:front/features/team/usecases/delete_member_usecase.dart';
import 'package:front/features/team/usecases/get_team_by_id_usecase.dart';
import 'package:front/features/team/usecases/get_teams_use_case.dart';
import 'package:front/features/team/usecases/invitation_notification_usecase.dart';
import 'package:front/features/team/usecases/invite_team_by_email_usecase.dart';
import 'package:front/features/user/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:front/features/user/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:front/features/user/presentation/providers/user_controller.dart';
import 'package:front/features/user/repositories/user_repositories.dart';
import 'package:front/features/user/usecase/auto_sign_in_check_usecase.dart';
import 'package:front/features/user/usecase/change_password_usecase.dart';
import 'package:front/features/user/usecase/check_token_usecase.dart';
import 'package:front/features/user/usecase/get_token_usecase.dart';
import 'package:front/features/user/usecase/get_user_info_usecase.dart';
import 'package:front/features/user/usecase/save_token_usecase.dart';
import 'package:front/features/user/usecase/set_auto_sign_in_false_use_case.dart';
import 'package:front/features/user/usecase/set_auto_sign_in_true_use_case.dart';
import 'package:front/features/user/usecase/sign_in_usecase.dart';
import 'package:front/features/user/usecase/sign_out_usecase.dart';
import 'package:front/features/user/usecase/sign_up_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;

final teamRemoteDataSource = locator<TeamRemoteDataSource>();
final teamRepository = locator<TeamRepository>();

final getTeamsUseCase = locator<GetTeamsUseCase>();
final createTeamUseCase = locator<CreateTeamUseCase>();
final getTeamByIdUseCase = locator<GetTeamByIdUseCase>();

final answerToInvitationUseCase = locator<AnswerToInvitationUseCase>();
final deleteMemberUseCase = locator<DeleteMemberUseCase>();
final invitationNotificationUseCase = locator<InvitationNotificationUseCase>();
final inviteTeamByEmailUseCase = locator<InviteTeamByEmailUseCase>();

final userRemoteDataSource = locator<UserRemoteDataSource>();
final userLocalDataSource = locator<UserLocalDataSource>();

final userRepository = locator<UserRepository>();

final getUserInfoUseCase = locator<GetUserInfoUseCase>();
final autoSignInCheckUseCase = locator<AutoSignInCheckUseCase>();
final signInUseCase = locator<SignInUseCase>();
final signOutUseCase = locator<SignOutUseCase>();
final signUpUseCase = locator<SignUpUseCase>();
final changePasswordUseCase = locator<ChangePasswordUseCase>();
final setAutoSignInTrueUseCase = locator<SetAutoSignInTrueUseCase>();
final setAutoSignInFalseUseCase = locator<SetAutoSignInFalseUseCase>();
final getTokenUseCase = locator<GetTokenUseCase>();
final saveTokenUseCase = locator<SaveTokenUseCase>();
final checkTokenUseCase = locator<CheckTokenUseCase>();

final secureStorage = locator<FlutterSecureStorage>();
final sharedPreferences = locator<SharedPreferencesService>();
void initLocator() {
  TeamDependencyInjection().init();
  UserDependencyInjection().init();
}

final tokenChangeNotifer = locator<AuthController>();
