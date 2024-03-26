import 'package:front/app/domain/form_example/form_demo2.dart';
import 'package:front/app/domain/presentation/home/home.dart';
import 'package:front/app/domain/presentation/main/screen/main_screen.dart';
import 'package:front/app/domain/presentation/project/screen/project_creation.dart';
import 'package:front/app/domain/presentation/project/screen/project_detail.dart';
import 'package:front/app/domain/presentation/project/screen/project_update.dart';
import 'package:front/app/domain/presentation/task/screen/task_create_screen.dart';
import 'package:front/app/domain/presentation/team/screen/team_create.dart';
import 'package:front/app/domain/presentation/team/screen/team_datail.dart';
import 'package:front/app/domain/presentation/team/screen/teams_list.dart';
import 'package:front/app/domain/presentation/user/screen/change_info_list.dart';
import 'package:front/app/domain/presentation/user/screen/email_singin.dart';
import 'package:front/app/domain/presentation/user/screen/login.dart';
import 'package:front/app/domain/presentation/user/screen/my_info_screen.dart';
import 'package:front/app/domain/presentation/user/screen/signin.dart';
import 'package:front/app/domain/presentation/user/screen/social_login_info_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
    GoRoute(
      path: 'example',
      name: 'example',
      builder: (context, state) => const FormDemoScreen2(),
    ),
    GoRoute(
      path: 'login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: 'signup',
      name: 'signup',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: 'emailSignup',
      name: 'emailSignup',
      builder: (context, state) => const EmailSignInScreen(),
    ),
    GoRoute(
      path: 'teamsList',
      name: 'teamsList',
      builder: (context, state) => const TeamsListScreen(),
    ),
    GoRoute(
      path: 'teamCreate',
      name: 'teamCreate',
      builder: (context, state) => const TeamCreateScreen(),
    ),
    GoRoute(
      path: 'teamDetail',
      name: 'teamDetail',
      builder: (context, state) => TeamDetailScreen(),
    ),
    GoRoute(
      path: 'projectDetail',
      name: 'projectDetail',
      builder: (context, state) => const ProjectDetailScreen(),
    ),
    GoRoute(
      path: 'projectCreation',
      name: 'projectCreation',
      builder: (context, state) => ProjectCreationScreen(),
    ),
    GoRoute(
      path: 'projectUpdate',
      name: 'projectUpdate',
      builder: (context, state) => ProjectUpdateScreen(),
    ),
    GoRoute(
      path: 'taskCreate',
      name: 'taskCreate',
      builder: (context, state) => TaskCreateScreen(),
    ),
    ShellRoute(
        builder: (context, state, child) => ScaffoldWithMyInfo(child: child),
        routes: [
          GoRoute(
            path: 'myInfo',
            name: 'myInfo',
            builder: (context, state) => SocialLoginInfoScreen(),
          ),
          GoRoute(
            path: 'changeMyInfoList',
            name: 'changeMyInfoList',
            pageBuilder: (context, state) =>
                NoTransitionPage<void>(child: ChangeInfoListScreen()),
          ),
        ]),
    GoRoute(
      path: 'main',
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
  ]),
]);
