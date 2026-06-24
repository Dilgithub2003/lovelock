import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/love_locker/widgets/love_locker_option_tile.dart';
import 'package:love_lock/features/love_locker/widgets/love_locker_section.dart';
import 'package:love_lock/features/love_locker/widgets/love_locker_summary_card.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Love Locker feature options screen (UI-only).
class LoveLockerScreen extends StatelessWidget {
  const LoveLockerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DashboardScaffold(
      currentTab: DashboardTab.home,
      onTabSelected: (tab) => _onTabSelected(context, tab),
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
                  'Love Locker',
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 140,
                      width: double.infinity,
                      child: Image.asset(
                        AppAssets.coupleImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionMd),
                  const LoveLockerSummaryCard(),
                  const SizedBox(height: AppSpacing.sectionLg),
                  LoveLockerSection(
                    title: 'ACCOUNT MANAGEMENT',
                    children: [
                      LoveLockerOptionTile(
                        icon: Icons.person_add_alt_1_outlined,
                        label: 'Add funds',
                        onTap: () => context.push(AppRoutes.addFunds),
                      ),
                      LoveLockerOptionTile(
                        icon: Icons.link_rounded,
                        label: 'Request Loan',
                        onTap: () => context.push(AppRoutes.borrowFunds),
                      ),
                      LoveLockerOptionTile(
                        icon: Icons.delete_outline_rounded,
                        label: 'Refund Loan',
                        onTap: () => context.push(AppRoutes.settleLoan),
                      ),
                      LoveLockerOptionTile(
                        icon: Icons.favorite_border_rounded,
                        label: 'Initiate unlock request',
                        onTap: () => context.push(AppRoutes.unlockRequest),
                      ),
                      LoveLockerOptionTile(
                        icon: Icons.favorite_rounded,
                        label: 'Disburse policy',
                        onTap: () => context.push(AppRoutes.disbursePolicy),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  LoveLockerSection(
                    title: 'SUPPORT',
                    children: [
                      LoveLockerOptionTile(
                        icon: Icons.help_outline_rounded,
                        label: 'Help & FAQs',
                        onTap: () {},
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

  void _onTabSelected(BuildContext context, DashboardTab tab) {
    switch (tab) {
      case DashboardTab.home:
      case DashboardTab.feed:
      case DashboardTab.shopping:
      case DashboardTab.settings:
        context.go(AppRoutes.dashboard);
    }
  }
}
