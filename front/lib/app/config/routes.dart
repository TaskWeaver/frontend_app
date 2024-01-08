import 'package:front/app/domain/presentation/home/home.dart';
import 'package:front/app/domain/presentation/login/email_singin.dart';
import 'package:front/app/domain/presentation/login/login.dart';
import 'package:front/app/domain/presentation/login/signin.dart';

class RouteName {
  static const home = '/';
  static const login = '/login';
  static const signIn = '/signIn';
  static const emailSignIn = '/emailSignIn';
}

var nameRoutes = {
  RouteName.home: (context) => const HomeScreen(),
  RouteName.login: (context) => const LoginScreen(),
  RouteName.signIn: (context) => const SignInScreen(),
  RouteName.emailSignIn: (context) => const EmailSignInScreen(),
};
