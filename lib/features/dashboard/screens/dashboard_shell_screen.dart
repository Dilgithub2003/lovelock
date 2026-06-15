import 'package:flutter/material.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/screens/dashboard_home_screen.dart';
import 'package:love_lock/features/dashboard/screens/settings_screen.dart';
import 'package:love_lock/features/feed/screens/social_feed_screen.dart';
import 'package:love_lock/features/shopping/screens/shopping_screen.dart';
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
          SocialFeedScreen(
            onOpenSettings: () => _selectTab(DashboardTab.settings),
          ),
          ShoppingScreen(
            onOpenSettings: () => _selectTab(DashboardTab.settings),
          ),
          SettingsScreen(
            onBack: () => _selectTab(DashboardTab.home),
          ),
        ],
      ),
    );
  }
}

