import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';

/// Reusable bottom navigation for dashboard screens.
class DashboardBottomNavBar extends StatelessWidget {
  const DashboardBottomNavBar({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final DashboardTab currentTab;
  final ValueChanged<DashboardTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_rounded,
            label: 'HOME',
            isActive: currentTab == DashboardTab.home,
            onTap: () => onTabSelected(DashboardTab.home),
          ),
          _NavItem(
            icon: Icons.lock_outline_rounded,
            label: 'FEED',
            isActive: currentTab == DashboardTab.feed,
            onTap: () => onTabSelected(DashboardTab.feed),
          ),
          _NavItem(
            icon: Icons.person_outline_rounded,
            label: 'SHOPPING',
            isActive: currentTab == DashboardTab.shopping,
            onTap: () => onTabSelected(DashboardTab.shopping),
          ),
          _NavItem(
            icon: Icons.settings_outlined,
            label: 'SETTINGS',
            isActive: currentTab == DashboardTab.settings,
            onTap: () => onTabSelected(DashboardTab.settings),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? AppColors.primary
        : AppColors.onBackground.withValues(alpha: 0.45);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
