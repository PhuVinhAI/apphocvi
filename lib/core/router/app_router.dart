import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/practice/presentation/screens/practice_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/vocabulary/data/models/word_model.dart';
import '../../features/vocabulary/presentation/screens/example_sentences_screen.dart';
import '../../features/vocabulary/presentation/screens/flashcard_learning_screen.dart';
import '../../features/vocabulary/presentation/screens/learning_complete_screen.dart';
import '../../features/vocabulary/presentation/screens/quiz_fill_blank_screen.dart';
import '../../features/vocabulary/presentation/screens/quiz_multi_choice_screen.dart';
import '../../features/vocabulary/presentation/screens/vocabulary_detail_screen.dart';
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
              routes: [
                GoRoute(
                  path: 'detail',
                  builder: (context, state) {
                    final word = state.extra as WordModel;
                    return VocabularyDetailScreen(word: word);
                  },
                ),
                GoRoute(
                  path: 'flashcard',
                  builder: (context, state) {
                    final word = state.extra as WordModel;
                    return FlashcardLearningScreen(word: word);
                  },
                ),
                GoRoute(
                  path: 'examples',
                  builder: (context, state) {
                    final word = state.extra as WordModel;
                    return ExampleSentencesScreen(word: word);
                  },
                ),
                GoRoute(
                  path: 'quiz',
                  builder: (context, state) {
                    final word = state.extra as WordModel;
                    return QuizMultiChoiceScreen(word: word);
                  },
                ),
                GoRoute(
                  path: 'quiz-fill',
                  builder: (context, state) {
                    final word = state.extra as WordModel;
                    return QuizFillBlankScreen(word: word);
                  },
                ),
                GoRoute(
                  path: 'complete',
                  builder: (context, state) {
                    final word = state.extra as WordModel;
                    return LearningCompleteScreen(word: word);
                  },
                ),
              ],
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