import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_tokens.dart';
import '../../data/models/word_model.dart';

class LearningCompleteScreen extends StatelessWidget {
  final WordModel word;

  const LearningCompleteScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTokens.success, // Bold green flat background
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // Success Icon
            Container(
              padding: const EdgeInsets.all(AppTokens.space2xl),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                LucideIcons.check,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppTokens.space2xl),

            // Title
            Text(
              'Lesson\nComplete',
              style: AppTokens.text3xl.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 56,
                letterSpacing: -2.0,
                height: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTokens.spaceLg),
            Text(
              'Mastered "${word.word}"',
              style: AppTokens.textXl.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: AppTokens.space2xl),

            // Flat Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTokens.space2xl),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFlatStatItem('XP Gained', '+15', LucideIcons.zap),
                  Container(width: 1, height: 60, color: Colors.white.withValues(alpha: 0.3)),
                  _buildFlatStatItem('Accuracy', '100%', LucideIcons.target),
                ],
              ),
            ),

            const Spacer(),

            // Flat Bottom Action
            Padding(
              padding: const EdgeInsets.all(AppTokens.spaceLg),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/vocab');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppTokens.success,
                    padding: const EdgeInsets.symmetric(vertical: AppTokens.spaceXl),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTokens.radiusFull)),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue',
                    style: AppTokens.textXl.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlatStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: AppTokens.spaceSm),
            Text(
              value,
              style: AppTokens.text3xl.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTokens.spaceXs),
        Text(
          label,
          style: AppTokens.textBase.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
