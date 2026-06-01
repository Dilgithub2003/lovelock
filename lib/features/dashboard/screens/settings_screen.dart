import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/dashboard/models/settings_detail_args.dart';
import 'package:love_lock/features/dashboard/widgets/settings_menu_tile.dart';
import 'package:love_lock/features/love_locker/widgets/love_locker_section.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Settings tab content (used inside [DashboardShellScreen]).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  void _openDetail(BuildContext context, String title, {String? message}) {
    context.push(
      AppRoutes.settingsDetail,
      extra: SettingsDetailArgs(title: title, message: message),
    );
  }

  void _onLogOut(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          'Log Out',
          style: TextStyle(color: AppColors.onBackground),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: TextStyle(
            color: AppColors.onBackground.withValues(alpha: 0.7),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.go(AppRoutes.login);
            },
            child: const Text(
              'Log Out',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 8, 4),
          child: Row(
            children: [
              IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back),
                color: AppColors.onBackgroundAccent,
              ),
              Text(
                'Settings',
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
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoveLockerSection(
                  title: 'ACCOUNT MANAGEMENT',
                  children: [
                    SettingsMenuTile(
                      icon: Icons.person_outline_rounded,
                      label: 'Personal Information',
                      onTap: () => context.push(AppRoutes.profile),
                    ),
                    SettingsMenuTile(
                      icon: Icons.lock_outline_rounded,
                      label: 'Change Password',
                      onTap: () => context.push(AppRoutes.createNewPassword),
                    ),
                    SettingsMenuTile(
                      icon: Icons.link_rounded,
                      label: 'Linked Accounts',
                      onTap: () => context.push(AppRoutes.linkedAccounts),
                    ),
                    SettingsMenuTile(
                      icon: Icons.delete_outline_rounded,
                      label: 'Delete Account',
                      onTap: () => _openDetail(
                        context,
                        'Delete Account',
                        message:
                            'Deleting your account is permanent. Contact support '
                            'or connect your account deletion API here.',
                      ),
                      showDivider: false,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sectionLg),
                LoveLockerSection(
                  title: 'PREFERENCES',
                  children: [
                    SettingsMenuTile(
                      icon: Icons.notifications_outlined,
                      label: 'Notifications',
                      onTap: () => context.push(AppRoutes.notifications),
                    ),
                    SettingsMenuTile(
                      icon: Icons.privacy_tip_outlined,
                      label: 'Privacy',
                      onTap: () => _openDetail(
                        context,
                        'Privacy',
                        message:
                            'Control data sharing, visibility, and security '
                            'preferences for your Love Lock account.',
                      ),
                      showDivider: false,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sectionLg),
                LoveLockerSection(
                  title: 'SUPPORT',
                  children: [
                    SettingsMenuTile(
                      icon: Icons.help_outline_rounded,
                      label: 'Help & FAQs',
                      onTap: () => _openDetail(
                        context,
                        'Help & FAQs',
                        message:
                            'Find answers about Love Lock funds, partner linking, '
                            'borrowing, and unlocking your shared vault.',
                      ),
                      showDivider: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        PrimaryButton(
          label: 'Log Out',
          onPressed: () => _onLogOut(context),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
