import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/dashboard/widgets/notification_setting_tile.dart';
import 'package:love_lock/features/dashboard/widgets/notifications_hero_card.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Notification preferences screen (UI-only).
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _fundReminders = true;
  bool _partnerActivity = true;
  bool _sharingConfirmations = false;
  bool _systemAnnouncements = true;
  bool _pushNotifications = true;
  bool _emailAlerts = true;
  bool _inAppAlerts = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DashboardScaffold(
      currentTab: DashboardTab.home,
      onTabSelected: (tab) => context.go(AppRoutes.dashboard),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 8, 4),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back),
                  color: AppColors.onBackgroundAccent,
                ),
                Text(
                  'Notifications',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.onBackgroundAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const NotificationsHeroCard(),
                  const SizedBox(height: AppSpacing.sectionLg),
                  _NotificationGroup(
                    icon: Icons.favorite_rounded,
                    title: 'LOVE LOCK ALERTS',
                    children: [
                      NotificationSettingTile(
                        title: 'Fund Reminders',
                        subtitle: 'Get notified to add funds regularly',
                        value: _fundReminders,
                        onChanged: (v) => setState(() => _fundReminders = v),
                      ),
                      NotificationSettingTile(
                        title: 'Partner Activity',
                        subtitle: 'Updates when your partner adds funds',
                        value: _partnerActivity,
                        onChanged: (v) => setState(() => _partnerActivity = v),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  _NotificationGroup(
                    icon: Icons.share_outlined,
                    title: 'SOCIAL',
                    children: [
                      NotificationSettingTile(
                        title: 'Sharing Confirmations',
                        subtitle: 'Confirmations for social media shares',
                        value: _sharingConfirmations,
                        onChanged: (v) =>
                            setState(() => _sharingConfirmations = v),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  _NotificationGroup(
                    icon: Icons.settings_outlined,
                    title: 'SYSTEM',
                    children: [
                      NotificationSettingTile(
                        title: 'System Announcements',
                        subtitle: 'Updates about the app and features',
                        value: _systemAnnouncements,
                        onChanged: (v) =>
                            setState(() => _systemAnnouncements = v),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  _NotificationGroup(
                    icon: Icons.play_arrow_rounded,
                    title: 'DELIVERY METHODS',
                    children: [
                      NotificationSettingTile(
                        title: 'Push Notifications',
                        value: _pushNotifications,
                        onChanged: (v) => setState(() => _pushNotifications = v),
                      ),
                      NotificationSettingTile(
                        title: 'Email Alerts',
                        value: _emailAlerts,
                        onChanged: (v) => setState(() => _emailAlerts = v),
                      ),
                      NotificationSettingTile(
                        title: 'In-App Alerts',
                        value: _inAppAlerts,
                        onChanged: (v) => setState(() => _inAppAlerts = v),
                        showDivider: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationGroup extends StatelessWidget {
  const _NotificationGroup({
    required this.icon,
    required this.title,
    required this.children,
  });

  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Row(
            children: [
              Icon(icon, size: 14, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBackground.withValues(alpha: 0.55),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceMuted,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
