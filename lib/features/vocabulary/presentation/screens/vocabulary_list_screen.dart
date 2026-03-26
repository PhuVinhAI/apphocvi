import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      backgroundColor: AppTokens.background,
      appBar: AppBar(
        title: const Text(
          'Vocabulary Courses',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.refreshCw, color: Colors.black87),
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
                style: AppTokens.textSm.copyWith(
                  color: AppTokens.textTertiary,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemCount: groupedWords.keys.length,
            itemBuilder: (context, levelIndex) {
              final level = groupedWords.keys.elementAt(levelIndex);
              final topics = groupedWords[level]!;

              return Padding(
                padding: const EdgeInsets.only(bottom: AppTokens.space2xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Level $level', style: AppStyles.h2()),
                    const SizedBox(height: 16),
                    ...topics.entries.map((topicEntry) {
                      final topic = topicEntry.key;
                      final words = topicEntry.value;

                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppTokens.spaceLg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(topic, style: AppStyles.h3()),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: words.length,
                                clipBehavior: Clip.none,
                                itemBuilder: (context, wordIndex) {
                                  final word = words[wordIndex];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      right: AppTokens.spaceMd,
                                      top: AppTokens.spaceXs,
                                      bottom: AppTokens.spaceXs,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Selected: ${word.word}',
                                            ),
                                            behavior:
                                                SnackBarBehavior.floating,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 140,
                                        padding: const EdgeInsets.all(
                                          AppTokens.spaceMd,
                                        ),
                                        decoration: AppStyles.vocabCard(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              word.word,
                                              style:
                                                  AppTokens.textXl.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppTokens.primary,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: AppTokens.spaceSm,
                                            ),
                                            Text(
                                              word.definition,
                                              style:
                                                  AppTokens.textSm.copyWith(
                                                color:
                                                    AppTokens.textSecondary,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF2563EB),
          ),
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