import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_bottom_nav_bar.dart';

/// Reusable dashboard layout: body content + shared bottom navigation.
class DashboardScaffold extends StatelessWidget {
  const DashboardScaffold({
    super.key,
    required this.body,
    required this.currentTab,
    required this.onTabSelected,
  });

  final Widget body;
  final DashboardTab currentTab;
  final ValueChanged<DashboardTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(child: body),
            DashboardBottomNavBar(
              currentTab: currentTab,
              onTabSelected: onTabSelected,
            ),
          ],
        ),
      ),
    );
  }
}
