import 'package:front/features/form_example/form_demo2.dart';
import 'package:front/features/home.dart';
import 'package:front/features/project/presentaion/screen/project_creation.dart';
import 'package:front/features/project/presentaion/screen/project_detail.dart';
import 'package:front/features/project/presentaion/screen/project_update.dart';
import 'package:front/features/task/presentation/screen/task_detail_page.dart';
import 'package:front/features/team/presentation/pages/team/team_create_view.dart';
import 'package:front/features/team/presentation/pages/team/team_datail_view.dart';
import 'package:front/features/team/presentation/pages/team/teams_list_view.dart';
import 'package:front/features/user/presentation/component/change_info_list.dart';
import 'package:front/features/user/presentation/screens/email_singin.dart';
import 'package:front/features/user/presentation/screens/login.dart';
import 'package:front/features/user/presentation/screens/main_screen.dart';
import 'package:front/features/user/presentation/screens/my_info_screen.dart';
import 'package:front/features/user/presentation/screens/signin.dart';
import 'package:front/features/user/presentation/screens/social_login_info_screen.dart';
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
      builder: (context, state) => const TeamsListView(),
    ),
    GoRoute(
      path: 'teamCreate',
      name: 'teamCreate',
      builder: (context, state) => const TeamCreateView(),
    ),
    GoRoute(
      path: 'teamDetail/:teamId',
      name: 'teamDetail/:teamId',
      builder: (context, state) {
        return TeamDetailView(state.pathParameters['teamId']!);
      },
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
      path: 'main',
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
        path: 'taskDetail',
        name: 'taskDetail',
        builder: (context, state) => const TaskDetailScreen()),
    ShellRoute(
        builder: (context, state, child) => ScaffoldWithMyInfo(child: child),
        routes: [
          GoRoute(
            path: 'myInfo',
            name: 'myInfo',
            builder: (context, state) => const SocialLoginInfoScreen(),
          ),
          GoRoute(
            path: 'changeMyInfoList',
            name: 'changeMyInfoList',
            pageBuilder: (context, state) =>
                const NoTransitionPage<void>(child: ChangeInfoListScreen()),
          ),
        ]),
  ]),
]);
