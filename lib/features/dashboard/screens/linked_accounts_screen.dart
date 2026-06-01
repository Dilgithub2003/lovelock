import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/models/settings_detail_args.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/dashboard/widgets/linked_accounts_menu_tile.dart';
import 'package:love_lock/features/dashboard/widgets/linked_accounts_partner_header.dart';
import 'package:love_lock/features/love_locker/widgets/love_locker_section.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Linked accounts and partner management screen (UI-only).
class LinkedAccountsScreen extends StatelessWidget {
  const LinkedAccountsScreen({super.key});

  void _showUnlinkDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          'Unlink Partner',
          style: TextStyle(color: AppColors.onBackground),
        ),
        content: Text(
          'This will end your current love lock. This action cannot be undone.',
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
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Unlink',
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
                  'Linked Accounts',
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
                  const LinkedAccountsPartnerHeader(),
                  const SizedBox(height: AppSpacing.sectionLg),
                  LoveLockerSection(
                    title: 'PARTNER DETAILS',
                    children: [
                      LinkedAccountsMenuTile(
                        leadingAvatar: ClipOval(
                          child: Image.asset(
                            AppAssets.logo,
                            width: 44,
                            height: 44,
                            fit: BoxFit.cover,
                          ),
                        ),
                        icon: Icons.person_outline_rounded,
                        title: "Sarah's Profile",
                        subtitle: "View Sarah's basic profile",
                        onTap: () => context.push(
                          AppRoutes.settingsDetail,
                          extra: const SettingsDetailArgs(
                            title: "Sarah's Profile",
                            message:
                                "View Sarah's shared profile, love points, "
                                'and partnership status.',
                          ),
                        ),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  LoveLockerSection(
                    title: 'LOVE LOCK MANAGEMENT',
                    children: [
                      LinkedAccountsMenuTile(
                        icon: Icons.favorite_rounded,
                        title: 'Love Lock Status',
                        subtitle: 'Active & Fully Encrypted',
                        onTap: () => context.push(AppRoutes.loveLocker),
                      ),
                      LinkedAccountsMenuTile(
                        icon: Icons.person_add_alt_1_outlined,
                        title: 'Invite New Partner',
                        subtitle: 'Ends current lock & invites new',
                        onTap: () => context.push(AppRoutes.linkPartner),
                      ),
                      LinkedAccountsMenuTile(
                        icon: Icons.link_off_rounded,
                        title: 'Unlink Partner',
                        subtitle: 'This will end your current love lock',
                        titleColor: AppColors.primary,
                        trailing: Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.onBackground.withValues(alpha: 0.4),
                          size: 22,
                        ),
                        onTap: () => _showUnlinkDialog(context),
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
