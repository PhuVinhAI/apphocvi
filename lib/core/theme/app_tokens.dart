import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// Design tokens cho app - colors, spacing, typography, radius
/// Sử dụng final thay vì const để tránh const constructor issues
final class AppTokens {
  // ============ COLOR TOKENS ============
  
  // Primary colors
  static final primary = ColorToken('app.color.primary');
  static final primaryLight = ColorToken('app.color.primary.light');
  static final primaryDark = ColorToken('app.color.primary.dark');
  
  // Surface colors
  static final surface = ColorToken('app.color.surface');
  static final surfaceVariant = ColorToken('app.color.surface.variant');
  static final background = ColorToken('app.color.background');
  
  // Text colors
  static final textPrimary = ColorToken('app.color.text.primary');
  static final textSecondary = ColorToken('app.color.text.secondary');
  static final textTertiary = ColorToken('app.color.text.tertiary');
  
  // Semantic colors
  static final success = ColorToken('app.color.success');
  static final error = ColorToken('app.color.error');
  static final warning = ColorToken('app.color.warning');
  static final info = ColorToken('app.color.info');
  
  // ============ SPACE TOKENS ============
  
  static final spaceXs = SpaceToken('app.space.xs');
  static final spaceSm = SpaceToken('app.space.sm');
  static final spaceMd = SpaceToken('app.space.md');
  static final spaceLg = SpaceToken('app.space.lg');
  static final spaceXl = SpaceToken('app.space.xl');
  static final space2xl = SpaceToken('app.space.2xl');
  
  // ============ RADIUS TOKENS ============
  
  static final radiusSm = RadiusToken('app.radius.sm');
  static final radiusMd = RadiusToken('app.radius.md');
  static final radiusLg = RadiusToken('app.radius.lg');
  static final radiusXl = RadiusToken('app.radius.xl');
  static final radiusFull = RadiusToken('app.radius.full');
  
  // ============ TYPOGRAPHY TOKENS ============
  
  static final textXs = TextStyleToken('app.text.xs');
  static final textSm = TextStyleToken('app.text.sm');
  static final textBase = TextStyleToken('app.text.base');
  static final textLg = TextStyleToken('app.text.lg');
  static final textXl = TextStyleToken('app.text.xl');
  static final text2xl = TextStyleToken('app.text.2xl');
  static final text3xl = TextStyleToken('app.text.3xl');
}

/// Light theme token values
class AppTheme {
  static Map<ColorToken, Color> get colors => {
    AppTokens.primary: const Color(0xFF2563EB), // blue-600
    AppTokens.primaryLight: const Color(0xFF60A5FA), // blue-400
    AppTokens.primaryDark: const Color(0xFF1E40AF), // blue-700
    
    AppTokens.surface: Colors.white,
    AppTokens.surfaceVariant: const Color(0xFFF8FAFC), // slate-50
    AppTokens.background: const Color(0xFFF1F5F9), // slate-100
    
    AppTokens.textPrimary: const Color(0xFF0F172A), // slate-900
    AppTokens.textSecondary: const Color(0xFF475569), // slate-600
    AppTokens.textTertiary: const Color(0xFF94A3B8), // slate-400
    
    AppTokens.success: const Color(0xFF10B981), // green-500
    AppTokens.error: const Color(0xFFEF4444), // red-500
    AppTokens.warning: const Color(0xFFF59E0B), // amber-500
    AppTokens.info: const Color(0xFF3B82F6), // blue-500
  };
  
  static Map<SpaceToken, double> get spaces => {
    AppTokens.spaceXs: 4.0,
    AppTokens.spaceSm: 8.0,
    AppTokens.spaceMd: 16.0,
    AppTokens.spaceLg: 24.0,
    AppTokens.spaceXl: 32.0,
    AppTokens.space2xl: 48.0,
  };
  
  static Map<RadiusToken, Radius> get radii => {
    AppTokens.radiusSm: const Radius.circular(4),
    AppTokens.radiusMd: const Radius.circular(8),
    AppTokens.radiusLg: const Radius.circular(12),
    AppTokens.radiusXl: const Radius.circular(16),
    AppTokens.radiusFull: const Radius.circular(9999),
  };
  
  static Map<TextStyleToken, TextStyle> get textStyles => {
    AppTokens.textXs: const TextStyle(fontSize: 12, height: 1.4),
    AppTokens.textSm: const TextStyle(fontSize: 14, height: 1.4),
    AppTokens.textBase: const TextStyle(fontSize: 16, height: 1.5),
    AppTokens.textLg: const TextStyle(fontSize: 18, height: 1.5),
    AppTokens.textXl: const TextStyle(fontSize: 20, height: 1.5),
    AppTokens.text2xl: const TextStyle(fontSize: 24, height: 1.4),
    AppTokens.text3xl: const TextStyle(fontSize: 30, height: 1.3),
  };
}
