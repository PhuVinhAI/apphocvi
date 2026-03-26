import 'package:flutter/material.dart';

/// Design tokens cho app - colors, spacing, typography, radius
/// Flutter thuần - không dùng Mix
final class AppTokens {
  AppTokens._();

  // ============ COLOR TOKENS ============

  // Primary colors
  static const Color primary = Color(0xFF2563EB); // blue-600
  static const Color primaryLight = Color(0xFF60A5FA); // blue-400
  static const Color primaryDark = Color(0xFF1E40AF); // blue-700

  // Surface colors
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF8FAFC); // slate-50
  static const Color background = Color(0xFFF1F5F9); // slate-100

  // Text colors
  static const Color textPrimary = Color(0xFF0F172A); // slate-900
  static const Color textSecondary = Color(0xFF475569); // slate-600
  static const Color textTertiary = Color(0xFF94A3B8); // slate-400

  // Semantic colors
  static const Color success = Color(0xFF10B981); // green-500
  static const Color error = Color(0xFFEF4444); // red-500
  static const Color warning = Color(0xFFF59E0B); // amber-500
  static const Color info = Color(0xFF3B82F6); // blue-500

  // ============ SPACE TOKENS ============

  static const double spaceXs = 4.0;
  static const double spaceSm = 8.0;
  static const double spaceMd = 16.0;
  static const double spaceLg = 24.0;
  static const double spaceXl = 32.0;
  static const double space2xl = 48.0;

  // ============ RADIUS TOKENS ============

  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusFull = 9999.0;

  // ============ TYPOGRAPHY TOKENS ============

  static const TextStyle textXs = TextStyle(fontSize: 12, height: 1.4);
  static const TextStyle textSm = TextStyle(fontSize: 14, height: 1.4);
  static const TextStyle textBase = TextStyle(fontSize: 16, height: 1.5);
  static const TextStyle textLg = TextStyle(fontSize: 18, height: 1.5);
  static const TextStyle textXl = TextStyle(fontSize: 20, height: 1.5);
  static const TextStyle text2xl = TextStyle(fontSize: 24, height: 1.4);
  static const TextStyle text3xl = TextStyle(fontSize: 30, height: 1.3);
}
