import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';

import '../../data/repositories/vocabulary_repository.dart';

class TestVocabScreen extends ConsumerWidget {
  const TestVocabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedWordsAsync = ref.watch(groupedWordsProvider);

    // --- Styling Mix ---
    final centerStyle = BoxStyler().alignment(Alignment.center);
    final errorTextStyle = TextStyler().color(Colors.red.shade700).fontSize(16);

    final metaTextStyle = TextStyler().color(Colors.grey.shade500).fontSize(14);

    final levelHeaderStyle = TextStyler()
        .fontSize(24)
        .fontWeight(FontWeight.bold)
        .color(Colors.black87);

    final topicHeaderStyle = TextStyler()
        .fontSize(18)
        .fontWeight(FontWeight.w600)
        .color(Colors.grey.shade700);

    final cardStyle = BoxStyler()
        .color(Colors.white)
        .width(140)
        .paddingAll(16)
        .marginOnly(right: 16, bottom: 8, top: 4)
        .borderRounded(16)
        .shadowOnly(color: Colors.black12, blurRadius: 4, offset: const Offset(0, 2))
        .animate(.easeInOut(200.ms))
        .onHovered(BoxStyler().color(Colors.blue.shade50).shadowOnly(color: Colors.black26, blurRadius: 8, offset: const Offset(0, 4)))
        .onPressed(BoxStyler().color(Colors.blue.shade100));

    final wordStyle = TextStyler()
        .fontSize(22)
        .fontWeight(FontWeight.bold)
        .color(Colors.blue.shade700);

    final defStyle = TextStyler()
        .fontSize(14)
        .color(Colors.grey.shade600)
        .textAlign(TextAlign.center)
        .maxLines(2)
        .overflow(TextOverflow.ellipsis);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Vocabulary Courses', style: TextStyle(fontWeight: FontWeight.w600)),
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
              child: StyledText('No vocabulary data available.', style: metaTextStyle),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemCount: groupedWords.keys.length,
            itemBuilder: (context, levelIndex) {
              final level = groupedWords.keys.elementAt(levelIndex);
              final topics = groupedWords[level]!;

              return ColumnBox(
                style: FlexBoxStyler().crossAxisAlignment(.start).marginOnly(bottom: 32),
                children: [
                  StyledText('Level $level', style: levelHeaderStyle),
                  const SizedBox(height: 16),

                  ...topics.entries.map((topicEntry) {
                    final topic = topicEntry.key;
                    final words = topicEntry.value;

                    return ColumnBox(
                      style: FlexBoxStyler().crossAxisAlignment(.start).marginOnly(bottom: 24),
                      children: [
                        StyledText(topic, style: topicHeaderStyle),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: words.length,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, wordIndex) {
                              final word = words[wordIndex];
                              return PressableBox(
                                style: cardStyle,
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
                                      .spacing(8),
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
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.blue)),
        error: (error, stack) => Box(
          style: centerStyle,
          child: StyledText('Error loading data:\n$error', style: errorTextStyle),
        ),
      ),
    );
  }
}