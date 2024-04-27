import 'package:flutter/material.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/home.dart';
import 'package:front/features/project/presentaion/screen/project_creation.dart';
import 'package:front/features/project/presentaion/screen/project_detail.dart';
import 'package:front/features/team/presentation/pages/team/team_create_page.dart';
import 'package:front/features/team/presentation/pages/team/team_datail.dart';
import 'package:front/features/team/presentation/pages/team/team_home.dart';
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
          path: 'team',
          name: 'team',
          builder: (context, state) => const TeamHome(),
          routes: [
            GoRoute(
              path: 'create',
              name: 'create',
              builder: (context, state) => const TeamCreatePage(),
            ),
            GoRoute(
              path: ':teamId',
              name: 'teamDetail',
              builder: (context, state) {
                return TeamDetailScreen(
                    teamId: state.pathParameters['teamId']!);
              },
              routes: [
                GoRoute(
                  path: 'project/create',
                  name: 'projectCreate',
                  builder: (context, state) => ProjectCreationScreen(
                      teamId: state.pathParameters['teamId']!),
                ),
                GoRoute(
                  path: 'project/:projectId',
                  name: 'project',
                  builder: (context, state) {
                    return ProjectDetailScreen(
                        projectId: state.pathParameters['projectId']!);
                  },
                )
              ],
            ),
          ],
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
/*   redirect: (context, state) {
    var isAuthenticated = tokenChangeNotifer.isToken;
    if (state.fullPath == '/signIn') {
      return isAuthenticated ? null : '/signIn';
    }

    /// null redirects to Initial Location

    return isAuthenticated ? null : '/signIn';
  }, */
);
