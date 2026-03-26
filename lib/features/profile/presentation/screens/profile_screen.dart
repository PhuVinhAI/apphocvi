import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTokens.surface,
      appBar: AppBar(
        title: Text('Profile', style: AppStyles.h2()),
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
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppTokens.surfaceVariant,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.user,
                  size: 64,
                  color: AppTokens.textTertiary,
                ),
              ),
              const SizedBox(height: AppTokens.space2xl),
              Text('Demo User', style: AppStyles.h1()),
              const SizedBox(height: AppTokens.spaceMd),
              Text('user@demo.com', style: AppStyles.bodySecondary()),
            ],
          ),
        ),
      ),
    );
  }
}