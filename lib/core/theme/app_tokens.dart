import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens cho app - colors, spacing, typography, radius
/// Flutter thuần - không dùng Mix
final class AppTokens {
  AppTokens._();

  // ============ COLOR TOKENS ============

  // Primary colors (More vibrant & modern AWWWARDS vibe)
  static const Color primary = Color(0xFF4338CA); // indigo-700
  static const Color primaryLight = Color(0xFF818CF8); // indigo-400
  static const Color primaryDark = Color(0xFF312E81); // indigo-900

  // Surface colors (Sleek cards)
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF8FAFC); // slate-50
  static const Color background = Color(0xFFFAFAFA); // very light gray

  // Text colors (Higher contrast)
  static const Color textPrimary = Color(0xFF0F172A); // slate-900
  static const Color textSecondary = Color(0xFF475569); // slate-600
  static const Color textTertiary = Color(0xFF94A3B8); // slate-400

  // Semantic colors (Aesthetic soft tones)
  static const Color success = Color(0xFF10B981); // green-500
  static const Color error = Color(0xFFF43F5E); // rose-500
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

  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 20.0;
  static const double radiusXl = 28.0;
  static const double radiusFull = 9999.0;

  // ============ TYPOGRAPHY TOKENS ============

  static final TextStyle textXs = GoogleFonts.outfit(fontSize: 12, height: 1.4, letterSpacing: 0.2);
  static final TextStyle textSm = GoogleFonts.outfit(fontSize: 14, height: 1.4, letterSpacing: 0.1);
  static final TextStyle textBase = GoogleFonts.outfit(fontSize: 16, height: 1.5, letterSpacing: 0);
  static final TextStyle textLg = GoogleFonts.outfit(fontSize: 18, height: 1.5, letterSpacing: -0.1);
  static final TextStyle textXl = GoogleFonts.outfit(fontSize: 20, height: 1.4, letterSpacing: -0.2);
  static final TextStyle text2xl = GoogleFonts.outfit(fontSize: 24, height: 1.3, letterSpacing: -0.4);
  static final TextStyle text3xl = GoogleFonts.outfit(fontSize: 32, height: 1.2, letterSpacing: -0.6);
}
