import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../data/repositories/vocabulary_repository.dart';

class VocabularyListScreen extends ConsumerWidget {
  const VocabularyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedWordsAsync = ref.watch(groupedWordsProvider);

    return Scaffold(
      backgroundColor: AppTokens.surface, // Pure white background
      appBar: AppBar(
        title: Text(
          'Courses',
          style: AppStyles.h2(),
        ),
        backgroundColor: AppTokens.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.refreshCw, color: AppTokens.textPrimary),
            onPressed: () => ref.invalidate(groupedWordsProvider),
          )
        ],
      ),
      body: groupedWordsAsync.when(
        data: (groupedWords) {
          if (groupedWords.isEmpty) {
            return Center(
              child: Text(
                'No vocabulary data available.',
                style: AppTokens.textBase.copyWith(color: AppTokens.textTertiary),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceLg, vertical: AppTokens.spaceMd),
            itemCount: groupedWords.keys.length,
            itemBuilder: (context, levelIndex) {
              final level = groupedWords.keys.elementAt(levelIndex);
              final topics = groupedWords[level]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppTokens.spaceXl, bottom: AppTokens.spaceMd),
                    child: Text('Level $level', style: AppStyles.h1()),
                  ),
                  ...topics.entries.map((topicEntry) {
                    final topic = topicEntry.key;
                    final words = topicEntry.value;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppTokens.space2xl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(topic, style: AppStyles.h3().copyWith(color: AppTokens.primary)),
                          const SizedBox(height: AppTokens.spaceLg),
                          Wrap(
                            spacing: AppTokens.spaceMd,
                            runSpacing: AppTokens.spaceMd,
                            children: words.map((word) {
                              return GestureDetector(
                                onTap: () => context.go('/vocab/detail', extra: word),
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppTokens.spaceLg,
                                    vertical: AppTokens.spaceMd,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTokens.background, // Light gray fill
                                    borderRadius: BorderRadius.circular(AppTokens.radiusFull), // Pill shape
                                    border: Border.all(color: AppTokens.surfaceVariant),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        word.word,
                                        style: AppTokens.textLg.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppTokens.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(width: AppTokens.spaceSm),
                                      Text(
                                        word.definition,
                                        style: AppTokens.textSm.copyWith(
                                          color: AppTokens.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppTokens.primary),
        ),
        error: (error, stack) => Center(
          child: Text(
            'Error loading data:\n$error',
            style: AppTokens.textBase.copyWith(color: AppTokens.error),
          ),
        ),
      ),
    );
  }
}