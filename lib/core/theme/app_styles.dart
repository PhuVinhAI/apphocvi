import 'dart:ui';

import 'package:mix/mix.dart';

import 'app_tokens.dart';

/// Reusable component styles cho toàn app
class AppStyles {
  // ============ CARD STYLES ============
  
  /// Card cơ bản - white background, rounded, shadow
  static BoxStyler card() => BoxStyler()
      .color(AppTokens.surface())
      .borderRadiusAll(AppTokens.radiusLg())
      .paddingAll(AppTokens.spaceMd())
      .shadowOnly(
        color: const Color(0x1A000000),
        blurRadius: 8,
        offset: const Offset(0, 2),
      );
  
  /// Card với hover effect
  static BoxStyler cardInteractive() => card()
      .animate(.easeInOut(200.ms))
      .onHovered(
        BoxStyler()
            .shadowOnly(
              color: const Color(0x26000000),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
            .scale(1.02),
      )
      .onPressed(BoxStyler().scale(0.98));
  
  /// Vocabulary card - compact size cho list
  static BoxStyler vocabCard() => BoxStyler()
      .color(AppTokens.surface())
      .width(140)
      .paddingAll(AppTokens.spaceMd())
      .borderRadiusAll(AppTokens.radiusXl())
      .shadowOnly(
        color: const Color(0x1A000000),
        blurRadius: 4,
        offset: const Offset(0, 2),
      )
      .animate(.easeInOut(200.ms))
      .onHovered(
        BoxStyler()
            .color(const Color(0x1A60A5FA)) // primaryLight với 10% opacity
            .shadowOnly(
              color: const Color(0x26000000),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
      )
      .onPressed(
        BoxStyler().color(const Color(0x3360A5FA)), // primaryLight với 20% opacity
      );
  
  // ============ BUTTON STYLES ============
  
  /// Primary button
  static BoxStyler buttonPrimary() => BoxStyler()
      .color(AppTokens.primary())
      .paddingX(AppTokens.spaceLg())
      .paddingY(AppTokens.spaceMd())
      .borderRadiusAll(AppTokens.radiusLg())
      .animate(.easeInOut(150.ms))
      .onHovered(BoxStyler().color(AppTokens.primaryDark()))
      .onPressed(BoxStyler().scale(0.96));
  
  /// Secondary button
  static BoxStyler buttonSecondary() => BoxStyler()
      .color(AppTokens.surfaceVariant())
      .paddingX(AppTokens.spaceLg())
      .paddingY(AppTokens.spaceMd())
      .borderRadiusAll(AppTokens.radiusLg())
      .animate(.easeInOut(150.ms))
      .onHovered(BoxStyler().color(AppTokens.background()))
      .onPressed(BoxStyler().scale(0.96));
  
  /// Icon button
  static BoxStyler iconButton() => BoxStyler()
      .size(40, 40)
      .borderRadiusAll(AppTokens.radiusMd())
      .animate(.easeInOut(150.ms))
      .onHovered(BoxStyler().color(AppTokens.surfaceVariant()))
      .onPressed(BoxStyler().scale(0.9));
  
  // ============ TEXT STYLES ============
  
  /// Heading 1
  static TextStyler h1() => TextStyler()
      .style(AppTokens.text3xl.mix())
      .fontWeight(FontWeight.bold)
      .color(AppTokens.textPrimary());
  
  /// Heading 2
  static TextStyler h2() => TextStyler()
      .style(AppTokens.text2xl.mix())
      .fontWeight(FontWeight.bold)
      .color(AppTokens.textPrimary());
  
  /// Heading 3
  static TextStyler h3() => TextStyler()
      .style(AppTokens.textXl.mix())
      .fontWeight(FontWeight.w600)
      .color(AppTokens.textPrimary());
  
  /// Body text
  static TextStyler body() => TextStyler()
      .style(AppTokens.textBase.mix())
      .color(AppTokens.textPrimary());
  
  /// Body secondary
  static TextStyler bodySecondary() => TextStyler()
      .style(AppTokens.textBase.mix())
      .color(AppTokens.textSecondary());
  
  /// Caption
  static TextStyler caption() => TextStyler()
      .style(AppTokens.textSm.mix())
      .color(AppTokens.textTertiary());
  
  /// Label
  static TextStyler label() => TextStyler()
      .style(AppTokens.textSm.mix())
      .fontWeight(FontWeight.w500)
      .color(AppTokens.textSecondary());
  
  // ============ LAYOUT STYLES ============
  
  /// Screen padding
  static BoxStyler screenPadding() => BoxStyler()
      .paddingX(AppTokens.spaceMd())
      .paddingY(AppTokens.spaceLg());
  
  /// Section spacing
  static FlexBoxStyler section() => FlexBoxStyler()
      .crossAxisAlignment(.start)
      .gap(AppTokens.spaceMd());
}
