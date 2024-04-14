import 'package:flutter/material.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/form_example/form_demo2.dart';
import 'package:front/features/home.dart';
import 'package:front/features/project/presentaion/screen/project_creation.dart';
import 'package:front/features/project/presentaion/screen/project_detail.dart';
import 'package:front/features/project/presentaion/screen/project_update.dart';
import 'package:front/features/team/presentation/pages/team/team_create.dart';
import 'package:front/features/team/presentation/pages/team/team_datail.dart';
import 'package:front/features/team/presentation/pages/team/teams_list.dart';
import 'package:front/features/user/presentation/component/change_info_list.dart';
import 'package:front/features/user/presentation/pages/my_info_screen.dart';
import 'package:front/features/user/presentation/pages/sign_in_page.dart';
import 'package:front/features/user/presentation/pages/social_login_info_screen.dart';
import 'package:go_router/go_router.dart';

final _key = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _key,

  /// Forwards diagnostic messages to the dart:developer log() API.
  debugLogDiagnostics: true,

  /// Initial Routing Location
  initialLocation: '/',

  /// The listeners are typically used to notify clients that the object has been
  /// updated.
  refreshListenable: tokenChangeNotifer,

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'example',
          name: 'example',
          builder: (context, state) => const FormDemoScreen2(),
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
          path: 'teamDetail/:teamId',
          name: 'teamDetail/:teamId',
          builder: (context, state) {
            return TeamDetailScreen(state.pathParameters['teamId']!);
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
          path: 'signIn',
          name: 'signIn',
          builder: (context, state) => const SignInScreen(),
        ),
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
          ],
        ),
      ],
    )
  ],
  redirect: (context, state) {
    var isAuthenticated = tokenChangeNotifer.isToken;
    if (state.fullPath == '/signIn') {
      return isAuthenticated ? null : '/signIn';
    }

    /// null redirects to Initial Location

    return isAuthenticated ? null : '/signIn';
  },
);
