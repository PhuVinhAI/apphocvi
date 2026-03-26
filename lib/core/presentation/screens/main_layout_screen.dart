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
      backgroundColor: AppTokens.surface, // Pure white background
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppTokens.surface,
          border: Border(
            top: BorderSide(color: AppTokens.surfaceVariant, width: 1.5), // Subtle line, no shadow
          ),
        ),
        padding: const EdgeInsets.only(
          left: AppTokens.spaceSm,
          right: AppTokens.spaceSm,
          top: AppTokens.spaceSm,
          bottom: AppTokens.spaceSm,
        ),
        child: SafeArea(
          top: false,
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
              icon: LucideIcons.search,
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
        ), // Close SafeArea
      ), // Close Container
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
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: AppTokens.spaceMd,
            vertical: AppTokens.spaceSm,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? AppTokens.textPrimary // Solid high contrast pill when active
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppTokens.radiusFull),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24,
                color: isActive
                    ? AppTokens.surface // White icon inside black pill
                    : AppTokens.textTertiary,
              ),
              const SizedBox(height: AppTokens.spaceXs),
              Text(
                label,
                style: AppTokens.textXs.copyWith(
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive
                      ? AppTokens.surface
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