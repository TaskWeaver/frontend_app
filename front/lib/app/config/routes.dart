import 'package:front/app/domain/presentation/home/home.dart';
import 'package:front/app/domain/presentation/login/email_singin.dart';
import 'package:front/app/domain/presentation/login/login.dart';
import 'package:front/app/domain/presentation/login/signin.dart';
import 'package:front/app/domain/presentation/project/presentation/project_creation_page/project_creation_page.dart';
import 'package:front/app/domain/presentation/project/presentation/project_detail_page/project_detail_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
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
      path: 'project',
      name: 'project',
      builder: (context, state) => const ProjectScreen(),
    ),
    GoRoute(
      path: 'addproject',
      name: 'addproject',
      builder: (context, state) => const AddProjectScreen(),
    ),
  ]),
]);
