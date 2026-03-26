import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';

import '../../theme/app_tokens.dart';

class MainLayoutScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayoutScreen({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Bottom nav container style - compact hơn
    final navBarContainerStyle = BoxStyler()
        .color(AppTokens.surface())
        .paddingX(AppTokens.spaceSm()) // Giảm horizontal padding
        .paddingTop(AppTokens.spaceXs()) // Giảm top padding
        .paddingBottom(AppTokens.spaceSm()) // Giảm bottom padding
        .borderTop(
          color: AppTokens.surfaceVariant(),
          width: 1,
        )
        .shadowOnly(
          color: const Color(0x0D000000),
          blurRadius: 12,
          offset: const Offset(0, -2),
        );

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: navigationShell,
      bottomNavigationBar: Box(
        style: navBarContainerStyle,
        child: RowBox(
          style: FlexBoxStyler()
              .mainAxisAlignment(.spaceAround)
              .crossAxisAlignment(.center),
          children: [
            _buildNavItem(
              context: context,
              icon: LucideIcons.bookOpen,
              label: 'Learn',
              index: 0,
            ),
            _buildNavItem(
              context: context,
              icon: LucideIcons.dumbbell,
              label: 'Practice',
              index: 1,
            ),
            _buildNavItem(
              context: context,
              icon: LucideIcons.user,
              label: 'Profile',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isActive = navigationShell.currentIndex == index;

    // Container style - compact hơn
    final itemContainerStyle = BoxStyler()
        .paddingX(AppTokens.spaceMd()) // Giảm horizontal padding
        .paddingY(AppTokens.spaceXs()) // Giảm vertical padding
        .borderRadiusAll(AppTokens.radiusLg())
        .color(
          isActive 
            ? const Color(0x1F2563EB)
            : Colors.transparent,
        )
        .animate(.easeInOut(250.ms));

    // Icon style - nhỏ hơn
    final iconStyle = IconStyler()
        .size(22) // Giảm từ 24 xuống 22
        .color(
          isActive 
            ? AppTokens.primary()
            : AppTokens.textTertiary(),
        )
        .animate(.easeInOut(250.ms));

    // Label style - nhỏ hơn
    final labelStyle = TextStyler()
        .fontSize(11) // Giảm từ 12 xuống 11
        .fontWeight(isActive ? FontWeight.w600 : FontWeight.w500)
        .color(
          isActive 
            ? AppTokens.primary()
            : AppTokens.textTertiary(),
        )
        .animate(.easeInOut(250.ms));

    return Expanded(
      child: PressableBox(
        onPress: () => _onTap(index),
        style: itemContainerStyle,
        child: ColumnBox(
          style: FlexBoxStyler()
              .mainAxisSize(.min)
              .crossAxisAlignment(.center)
              .gap(2), // Giảm gap từ 4 xuống 2
          children: [
            StyledIcon(icon: icon, style: iconStyle),
            StyledText(label, style: labelStyle),
          ],
        ),
      ),
    );
  }
}