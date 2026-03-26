import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../data/models/word_model.dart';
import '../providers/learning_session_provider.dart';

class VocabularyDetailScreen extends ConsumerWidget {
  final WordModel word;

  const VocabularyDetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTokens.surface, // Pure white
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppTokens.textPrimary),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/vocab');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceXl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppTokens.spaceLg),
            // HUGE Word
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                word.word,
                style: AppTokens.text3xl.copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppTokens.textPrimary,
                  fontSize: 72,
                  height: 1.0,
                  letterSpacing: -2.0,
                ),
              ),
            ),
            const SizedBox(height: AppTokens.spaceMd),
            Text(
              word.definition,
              style: AppTokens.text2xl.copyWith(
                color: AppTokens.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            if (word.notes != null && word.notes!.isNotEmpty) ...[
              const SizedBox(height: AppTokens.space2xl),
              Text('Notes', style: AppStyles.label()),
              const SizedBox(height: AppTokens.spaceSm),
              Text(
                word.notes!,
                style: AppTokens.textLg.copyWith(
                  color: AppTokens.textSecondary,
                  height: 1.6,
                ),
              ),
            ],
            
            const SizedBox(height: AppTokens.space2xl),
            Divider(color: AppTokens.surfaceVariant, height: 1),
            const SizedBox(height: AppTokens.space2xl),
            
            // Examples Section
            if (word.exampleSentences.isNotEmpty) ...[
              Text('Examples', style: AppStyles.label()),
              const SizedBox(height: AppTokens.spaceLg),
              ...List.generate(word.exampleSentences.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppTokens.spaceXl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        word.exampleSentences[index],
                        style: AppTokens.textXl.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppTokens.textPrimary,
                          height: 1.4,
                        ),
                      ),
                      if (word.exampleSentencesTranslated.length > index) ...[
                        const SizedBox(height: AppTokens.spaceXs),
                        Text(
                          word.exampleSentencesTranslated[index],
                          style: AppTokens.textBase.copyWith(
                            color: AppTokens.textSecondary,
                          ),
                        ),
                      ]
                    ],
                  ),
                );
              }),
            ],
            
            const SizedBox(height: 100), // Space for bottom button
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceXl),
        child: SizedBox(
          width: double.infinity,
          height: 64,
          child: ElevatedButton(
            onPressed: () {
              ref.read(learningSessionProvider.notifier).startSession(word);
              context.push('/vocab/flashcard', extra: word);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTokens.textPrimary, // Stark black/dark action button
              foregroundColor: AppTokens.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTokens.radiusFull),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Start Learning',
                  style: AppTokens.textXl.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: AppTokens.spaceMd),
                const Icon(LucideIcons.arrowRight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
