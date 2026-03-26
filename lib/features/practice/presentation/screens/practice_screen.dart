import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTokens.surface,
      appBar: AppBar(
        title: Text('Practice', style: AppStyles.h2()),
        backgroundColor: AppTokens.surface,
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
                LucideIcons.search,
                size: 80,
                color: AppTokens.surfaceVariant,
              ),
              const SizedBox(height: AppTokens.space2xl),
              Text('Coming soon...', style: AppStyles.h3().copyWith(color: AppTokens.textSecondary)),
            ],
          ),
        ),
      ),
    );
  }
}
