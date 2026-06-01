import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/screens/dashboard_home_screen.dart';
import 'package:love_lock/features/dashboard/screens/settings_screen.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';

/// Dashboard shell with shared bottom navigation across tabs.
class DashboardShellScreen extends StatefulWidget {
  const DashboardShellScreen({super.key});

  @override
  State<DashboardShellScreen> createState() => _DashboardShellScreenState();
}

class _DashboardShellScreenState extends State<DashboardShellScreen> {
  DashboardTab _currentTab = DashboardTab.home;

  void _selectTab(DashboardTab tab) {
    setState(() => _currentTab = tab);
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScaffold(
      currentTab: _currentTab,
      onTabSelected: _selectTab,
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          DashboardHomeScreen(
            onOpenSettings: () => _selectTab(DashboardTab.settings),
          ),
          const _PlaceholderTab(label: 'Feed'),
          const _PlaceholderTab(label: 'Shopping'),
          SettingsScreen(
            onBack: () => _selectTab(DashboardTab.home),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.onBackground.withValues(alpha: 0.5),
          fontSize: 18,
        ),
      ),
    );
  }
}
