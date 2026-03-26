import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/practice/presentation/screens/practice_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/vocabulary/presentation/screens/vocabulary_list_screen.dart';
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
              builder: (context, state) => const VocabularyListScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/practice',
              builder: (context, state) => const PracticeScreen(),
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