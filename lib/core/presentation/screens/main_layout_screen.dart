import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    return Scaffold(
      backgroundColor: AppTokens.background,
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppTokens.surface,
          border: Border(
            top: BorderSide(color: AppTokens.surfaceVariant, width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.only(
          left: AppTokens.spaceSm,
          right: AppTokens.spaceSm,
          top: AppTokens.spaceXs,
          bottom: AppTokens.spaceSm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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

    return Expanded(
      child: GestureDetector(
        onTap: () => _onTap(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(
            horizontal: AppTokens.spaceMd,
            vertical: AppTokens.spaceXs,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0x1F2563EB)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 22,
                color: isActive
                    ? AppTokens.primary
                    : AppTokens.textTertiary,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive
                      ? AppTokens.primary
                      : AppTokens.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}