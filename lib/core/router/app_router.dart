import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/vocabulary/presentation/screens/test_vocab_screen.dart';
import '../presentation/screens/main_layout_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/vocab',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainLayoutScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/vocab',
              builder: (context, state) => const TestVocabScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);