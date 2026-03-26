import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';

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
    final navBarContainerStyle = BoxStyler()
        .color(Colors.white)
        .paddingTop(12)
        .paddingBottom(32) // An toàn cho bottom safe area
        .borderTop(color: Colors.grey.shade200, width: 1)
        .shadowOnly(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, -4),
        );

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: navigationShell,
      bottomNavigationBar: Box(
        style: navBarContainerStyle,
        child: RowBox(
          style: FlexBoxStyler()
              .mainAxisAlignment(MainAxisAlignment.spaceAround)
              .crossAxisAlignment(CrossAxisAlignment.center),
          children: [
            _buildNavItem(
              context: context,
              icon: LucideIcons.bookOpen,
              label: 'Vocabulary',
              index: 0,
            ),
            _buildNavItem(
              context: context,
              icon: LucideIcons.user,
              label: 'Profile',
              index: 1,
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

    final itemStyle = BoxStyler()
        .paddingX(20)
        .paddingY(8)
        .borderRounded(16)
        .animate(.easeInOut(200.ms))
        .onHovered(BoxStyler().color(Colors.blue.shade50))
        .onPressed(BoxStyler().color(Colors.blue.shade100));

    final iconStyle = IconStyler()
        .size(24)
        .animate(.easeInOut(200.ms))
        .color(isActive ? Colors.blue.shade700 : Colors.grey.shade500);

    final labelStyle = TextStyler()
        .fontSize(12)
        .fontWeight(isActive ? .bold : .w500)
        .animate(.easeInOut(200.ms))
        .color(isActive ? Colors.blue.shade700 : Colors.grey.shade500);

    return PressableBox(
      onPress: () => _onTap(index),
      style: itemStyle,
      child: ColumnBox(
        style: FlexBoxStyler().mainAxisSize(MainAxisSize.min).spacing(4),
        children: [
          StyledIcon(icon: icon, style: iconStyle),
          StyledText(label, style: labelStyle),
        ],
      ),
    );
  }
}