import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';

import '../../data/repositories/vocabulary_repository.dart';

class TestVocabScreen extends ConsumerWidget {
  const TestVocabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsAsync = ref.watch(allWordsProvider);

    // --- Styling Mix ---
    final centerStyle = BoxStyler().alignment(.center);
    final errorTextStyle = TextStyler().color(Colors.red.shade700).fontSize(16);

    final cardStyle = BoxStyler()
        .color(Colors.white)
        .paddingAll(16)
        .marginOnly(bottom: 12, left: 16, right: 16)
        .borderRounded(16)
        .shadowOnly(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 2))
        .animate(.easeInOut(200.ms))
        .onHovered(BoxStyler().color(Colors.blue.shade50).shadowOnly(color: Colors.black26, blurRadius: 10, offset: const Offset(0, 4)))
        .onPressed(BoxStyler().color(Colors.blue.shade100));

    final rankBadgeStyle = BoxStyler()
        .color(Colors.blue.shade100)
        .size(40, 40)
        .borderRounded(20)
        .alignment(.center);

    final rankTextStyle = TextStyler()
        .color(Colors.blue.shade800)
        .fontWeight(FontWeight.bold)
        .fontSize(14);

    final wordTextStyle = TextStyler()
        .color(Colors.black87)
        .fontWeight(FontWeight.bold)
        .fontSize(20);

    final defTextStyle = TextStyler()
        .color(Colors.grey.shade700)
        .fontSize(15);

    final metaTextStyle = TextStyler()
        .color(Colors.grey.shade500)
        .fontSize(12);

    final iconStyle = IconStyler()
        .color(Colors.grey.shade400)
        .size(20);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Từ Vựng', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.refreshCw, color: Colors.black87),
            onPressed: () => ref.invalidate(allWordsProvider),
          )
        ],
      ),
      body: wordsAsync.when(
        data: (words) {
          if (words.isEmpty) {
            return Box(
              style: centerStyle,
              child: StyledText('Chưa có dữ liệu từ vựng', style: metaTextStyle),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            itemCount: words.length,
            itemBuilder: (context, index) {
              final word = words[index];
              return PressableBox(
                style: cardStyle,
                onPress: () {
                  final jsonString = const JsonEncoder.withIndent('  ').convert(word.toJson());
                  debugPrint('========== LOG WORD: ${word.word} ==========');
                  debugPrint(jsonString);
                  debugPrint('=============================================');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Đã in JSON của từ "${word.word}" ra console!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: RowBox(
                  style: FlexBoxStyler().crossAxisAlignment(CrossAxisAlignment.center).spacing(16),
                  children: [
                    Box(
                      style: rankBadgeStyle,
                      child: StyledText('${word.rank}', style: rankTextStyle),
                    ),
                    ColumnBox(
                      style: FlexBoxStyler().crossAxisAlignment(CrossAxisAlignment.start).spacing(4),
                      children: [
                        StyledText(word.word, style: wordTextStyle),
                        StyledText(word.definition, style: defTextStyle),
                        RowBox(
                          style: FlexBoxStyler().crossAxisAlignment(CrossAxisAlignment.center).spacing(6),
                          children: [
                            StyledIcon(icon: LucideIcons.tags, style: iconStyle.size(14)),
                            StyledText('${word.level} • ${word.topic}', style: metaTextStyle),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    StyledIcon(icon: LucideIcons.chevronRight, style: iconStyle),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.blue)),
        error: (error, stack) => Box(
          style: centerStyle,
          child: StyledText('Lỗi khi tải dữ liệu:\n$error', style: errorTextStyle),
        ),
      ),
    );
  }
}