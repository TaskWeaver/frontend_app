import 'package:front/app/domain/form_example/form_demo2.dart';
import 'package:front/app/domain/presentation/home/home.dart';
import 'package:front/app/domain/presentation/login/email_singin.dart';
import 'package:front/app/domain/presentation/login/login.dart';
import 'package:front/app/domain/presentation/login/signin.dart';
import 'package:front/app/domain/presentation/main/screen/main_screen.dart';
import 'package:front/app/domain/presentation/project/screen/project_creation.dart';
import 'package:front/app/domain/presentation/project/screen/project_detail.dart';
import 'package:front/app/domain/presentation/project/screen/project_update.dart';
import 'package:front/app/domain/presentation/task/task_detail/screen/task_detail_page.dart';
import 'package:front/app/domain/presentation/team/screen/team_create.dart';
import 'package:front/app/domain/presentation/team/screen/team_datail.dart';
import 'package:front/app/domain/presentation/team/screen/teams_list.dart';
import 'package:front/app/domain/presentation/todo/screen/todo_screen.dart';
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
      path: 'main',
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
        path: 'todo',
        name: 'todo',
        builder: (context, state) => const TodoScreen()),
    GoRoute(
        path: 'taskDetail',
        name: 'taskDetail',
        builder: (context, state) => const TaskDetailScreen())
  ]),
]);
