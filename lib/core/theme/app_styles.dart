import 'package:flutter/material.dart';

import 'app_tokens.dart';

/// Reusable component styles cho toàn app - Flutter thuần
class AppStyles {
  AppStyles._();

  // ============ CARD STYLES ============

  /// Card cơ bản - white background, rounded, shadow
  static BoxDecoration card() => BoxDecoration(
        color: AppTokens.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusLg),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      );

  /// Vocabulary card decoration
  static BoxDecoration vocabCard() => BoxDecoration(
        color: AppTokens.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusXl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      );

  // ============ TEXT STYLES ============

  /// Heading 1
  static TextStyle h1() => AppTokens.text3xl.copyWith(
        fontWeight: FontWeight.bold,
        color: AppTokens.textPrimary,
      );

  /// Heading 2
  static TextStyle h2() => AppTokens.text2xl.copyWith(
        fontWeight: FontWeight.bold,
        color: AppTokens.textPrimary,
      );

  /// Heading 3
  static TextStyle h3() => AppTokens.textXl.copyWith(
        fontWeight: FontWeight.w600,
        color: AppTokens.textPrimary,
      );

  /// Body text
  static TextStyle body() => AppTokens.textBase.copyWith(
        color: AppTokens.textPrimary,
      );

  /// Body secondary
  static TextStyle bodySecondary() => AppTokens.textBase.copyWith(
        color: AppTokens.textSecondary,
      );

  /// Caption
  static TextStyle caption() => AppTokens.textSm.copyWith(
        color: AppTokens.textTertiary,
      );

  /// Label
  static TextStyle label() => AppTokens.textSm.copyWith(
        fontWeight: FontWeight.w500,
        color: AppTokens.textSecondary,
      );
}
