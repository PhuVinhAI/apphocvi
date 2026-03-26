import 'package:flutter/material.dart';

import 'app_tokens.dart';

/// Reusable component styles cho toàn app - Flat Design Mobile (No Cards)
class AppStyles {
  AppStyles._();

  // ============ BRANDING & UI ELEMENTS ============

  /// Subtle container background instead of floating cards
  static BoxDecoration flatSurface() => BoxDecoration(
        color: AppTokens.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusLg),
        border: Border.all(color: AppTokens.surfaceVariant, width: 1.5),
      );

  /// Primary action flat button background
  static BoxDecoration primaryAction() => BoxDecoration(
        color: AppTokens.primary,
        borderRadius: BorderRadius.circular(AppTokens.radiusFull),
      );

  // ============ TEXT STYLES ============

  static TextStyle h1() => AppTokens.text3xl.copyWith(
        fontWeight: FontWeight.w800,
        color: AppTokens.textPrimary,
        height: 1.1,
        letterSpacing: -1.0,
      );

  static TextStyle h2() => AppTokens.text2xl.copyWith(
        fontWeight: FontWeight.w700,
        color: AppTokens.textPrimary,
        letterSpacing: -0.5,
      );

  static TextStyle h3() => AppTokens.textXl.copyWith(
        fontWeight: FontWeight.w600,
        color: AppTokens.textPrimary,
      );

  static TextStyle body() => AppTokens.textBase.copyWith(
        color: AppTokens.textPrimary,
      );

  static TextStyle bodySecondary() => AppTokens.textBase.copyWith(
        color: AppTokens.textSecondary,
      );

  static TextStyle caption() => AppTokens.textSm.copyWith(
        color: AppTokens.textTertiary,
      );

  static TextStyle label() => AppTokens.textSm.copyWith(
        fontWeight: FontWeight.w600,
        color: AppTokens.textSecondary,
        letterSpacing: 0.5,
      );
}
