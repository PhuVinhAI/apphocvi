import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../data/models/word_model.dart';
import '../providers/audio_player_provider.dart';

class ExampleSentencesScreen extends ConsumerWidget {
  final WordModel word;

  const ExampleSentencesScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasExamples = word.exampleSentences.isNotEmpty;

    return Scaffold(
      backgroundColor: AppTokens.surface, // Flat pure white
      appBar: AppBar(
        title: Text(
          'Examples',
          style: AppStyles.h3(),
        ),
        backgroundColor: AppTokens.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppTokens.textPrimary),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.push('/vocab/quiz', extra: word);
            },
            child: Text(
              'Skip',
              style: AppTokens.textBase.copyWith(
                color: AppTokens.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Flat Progress Line
            Container(height: 4, width: double.infinity, color: AppTokens.surfaceVariant,
              child: FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: 0.4,
                child: Container(color: AppTokens.primary),
              ),
            ),

            // Content
            Expanded(
              child: hasExamples
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceLg, vertical: AppTokens.spaceXl),
                      itemCount: word.exampleSentences.length,
                      separatorBuilder: (context, index) => const Divider(height: AppTokens.space2xl),
                      itemBuilder: (context, index) {
                        return _buildFlatExampleItem(
                          context,
                          ref,
                          index,
                          sentence: word.exampleSentences[index],
                          translation: word.exampleSentencesTranslated.length > index
                              ? word.exampleSentencesTranslated[index]
                              : null,
                          breakdown: word.sentenceBreakdowns.length > index
                              ? word.sentenceBreakdowns[index]
                              : null,
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No examples available.',
                        style: AppTokens.textLg.copyWith(color: AppTokens.textTertiary),
                      ),
                    ),
            ),

            // Flat Bottom Action
            Container(
              padding: const EdgeInsets.all(AppTokens.spaceLg),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTokens.surfaceVariant)),
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.push('/vocab/quiz', extra: word);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTokens.textPrimary, // Stark black/dark flat
                  foregroundColor: AppTokens.surface,
                  padding: const EdgeInsets.symmetric(vertical: AppTokens.spaceLg),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTokens.radiusFull)),
                  elevation: 0,
                ),
                child: Text(
                  'Continue Quizzes',
                  style: AppTokens.textLg.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlatExampleItem(
    BuildContext context,
    WidgetRef ref,
    int index, {
    required String sentence,
    String? translation,
    String? breakdown,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                sentence,
                style: AppTokens.text2xl.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTokens.textPrimary,
                  height: 1.3,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(width: AppTokens.spaceMd),
            IconButton(
              icon: const Icon(LucideIcons.volume2),
              color: AppTokens.primary,
              onPressed: () async {
                if (word.exampleSentencesAudioUrls.length > index) {
                  final url = word.exampleSentencesAudioUrls[index];
                  try {
                    await ref.read(audioPlayerProvider).setUrl(url);
                    ref.read(audioPlayerProvider).play();
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Audio stream not available for this example')),
                      );
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No audio link provided for this example')),
                  );
                }
              },
            ),
          ],
        ),
        if (translation != null) ...[
          const SizedBox(height: AppTokens.spaceSm),
          Text(
            translation,
            style: AppTokens.textLg.copyWith(
              color: AppTokens.textSecondary,
              height: 1.4,
            ),
          ),
        ],
        if (breakdown != null && breakdown.isNotEmpty) ...[
          const SizedBox(height: AppTokens.spaceLg),
          Container(
            padding: const EdgeInsets.only(left: AppTokens.spaceMd),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: AppTokens.primary, width: 4)),
            ),
            child: Text(
              breakdown,
              style: AppTokens.textBase.copyWith(color: AppTokens.textSecondary),
            ),
          ),
        ],
      ],
    );
  }
}
