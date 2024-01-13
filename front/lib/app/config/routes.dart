import 'package:front/app/domain/form_example/email_signup.dart';
import 'package:front/app/domain/presentation/home/home.dart';
import 'package:front/app/domain/presentation/login/email_singin.dart';
import 'package:front/app/domain/presentation/login/login.dart';
import 'package:front/app/domain/presentation/login/signin.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
    GoRoute(
      path: 'example',
      name: 'example',
      builder: (context, state) => const EmailSignInFormBuilderExampleScreen(),
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
  ]),
]);

