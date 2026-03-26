import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../data/repositories/vocabulary_repository.dart';

class VocabularyListScreen extends ConsumerWidget {
  const VocabularyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedWordsAsync = ref.watch(groupedWordsProvider);

    // --- Styling với AppStyles và AppTokens ---
    final centerStyle = BoxStyler().alignment(Alignment.center);
    
    final errorTextStyle = TextStyler()
        .color(AppTokens.error())
        .style(AppTokens.textBase.mix());

    final metaTextStyle = TextStyler()
        .color(AppTokens.textTertiary())
        .style(AppTokens.textSm.mix());

    final levelHeaderStyle = AppStyles.h2();

    final topicHeaderStyle = AppStyles.h3();

    final cardStyle = AppStyles.vocabCard();

    final wordStyle = TextStyler()
        .style(AppTokens.textXl.mix())
        .fontWeight(FontWeight.bold)
        .color(AppTokens.primary());

    final defStyle = TextStyler()
        .style(AppTokens.textSm.mix())
        .color(AppTokens.textSecondary())
        .textAlign(TextAlign.center)
        .maxLines(2)
        .overflow(TextOverflow.ellipsis);

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
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
            return Box(
              style: centerStyle,
              child: StyledText(
                'No vocabulary data available.',
                style: metaTextStyle,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemCount: groupedWords.keys.length,
            itemBuilder: (context, levelIndex) {
              final level = groupedWords.keys.elementAt(levelIndex);
              final topics = groupedWords[level]!;

              return ColumnBox(
                style: FlexBoxStyler()
                    .crossAxisAlignment(.start)
                    .marginBottom(AppTokens.space2xl()),
                children: [
                  StyledText('Level $level', style: levelHeaderStyle),
                  const SizedBox(height: 16),

                  ...topics.entries.map((topicEntry) {
                    final topic = topicEntry.key;
                    final words = topicEntry.value;

                    return ColumnBox(
                      style: FlexBoxStyler()
                          .crossAxisAlignment(.start)
                          .marginBottom(AppTokens.spaceLg()),
                      children: [
                        StyledText(topic, style: topicHeaderStyle),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: words.length,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, wordIndex) {
                              final word = words[wordIndex];
                              return PressableBox(
                                style: cardStyle
                                    .marginRight(AppTokens.spaceMd())
                                    .marginBottom(AppTokens.spaceXs())
                                    .marginTop(AppTokens.spaceXs()),
                                onPress: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Selected: ${word.word}'),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                child: ColumnBox(
                                  style: FlexBoxStyler()
                                      .mainAxisAlignment(.center)
                                      .crossAxisAlignment(.center)
                                      .gap(AppTokens.spaceSm()),
                                  children: [
                                    StyledText(word.word, style: wordStyle),
                                    StyledText(word.definition, style: defStyle),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF2563EB),
          ),
        ),
        error: (error, stack) => Box(
          style: centerStyle,
          child: StyledText(
            'Error loading data:\n$error',
            style: errorTextStyle,
          ),
        ),
      ),
    );
  }
}