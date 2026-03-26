import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTokens.background,
      appBar: AppBar(
        title: const Text(
          'Practice',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppTokens.spaceLg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                LucideIcons.dumbbell,
                size: 64,
                color: AppTokens.textTertiary,
              ),
              const SizedBox(height: AppTokens.spaceMd),
              Text('Practice Mode', style: AppStyles.h2()),
              const SizedBox(height: AppTokens.spaceMd),
              Text('Coming soon...', style: AppStyles.bodySecondary()),
            ],
          ),
        ),
      ),
    );
  }
}
