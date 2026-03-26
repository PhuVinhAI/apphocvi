import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final containerStyle = BoxStyler()
        .color(AppTokens.background())
        .paddingAll(AppTokens.spaceLg())
        .alignment(Alignment.center);

    final iconStyle = IconStyler()
        .size(64)
        .color(AppTokens.textTertiary());

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text(
          'Practice',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Box(
        style: containerStyle,
        child: ColumnBox(
          style: FlexBoxStyler()
              .mainAxisAlignment(.center)
              .crossAxisAlignment(.center)
              .gap(AppTokens.spaceMd()),
          children: [
            StyledIcon(icon: LucideIcons.dumbbell, style: iconStyle),
            StyledText(
              'Practice Mode',
              style: AppStyles.h2(),
            ),
            StyledText(
              'Coming soon...',
              style: AppStyles.bodySecondary(),
            ),
          ],
        ),
      ),
    );
  }
}
