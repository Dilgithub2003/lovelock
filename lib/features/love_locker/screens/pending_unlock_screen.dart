import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/love_locker/widgets/pending_unlock_detail_card.dart';
import 'package:love_lock/features/love_locker/widgets/pending_unlock_partner_card.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Partner review screen for a pending unlock request (UI-only).
class PendingUnlockScreen extends StatelessWidget {
  const PendingUnlockScreen({super.key});

  static const _actionBadgeColor = Color(0xFF3D1528);

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
                  'Unlock',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.onBackground,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: _actionBadgeColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'ACTION REQUIRED',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onBackground.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  Text(
                    'Pending Unlock',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onBackground,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  const PendingUnlockPartnerCard(partnerName: 'Sophia'),
                  const SizedBox(height: 12),
                  PendingUnlockDetailCard(
                    sectionLabel: 'REQUEST PURPOSE',
                    trailing: Icon(
                      Icons.lock_open_rounded,
                      size: 56,
                      color: AppColors.onBackground.withValues(alpha: 0.12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reason: Marriage',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.onBackground,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '"Celebrating our next chapter together!"',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            height: 1.4,
                            color: AppColors.onBackground.withValues(
                              alpha: 0.85,
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  PendingUnlockDetailCard(
                    sectionLabel: 'VAULT BALANCE',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LKR1,750',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Total Accumulated Funds',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 13,
                            color: AppColors.onBackground.withValues(
                              alpha: 0.65,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  PendingUnlockDetailCard(
                    sectionLabel: 'PROTOCOL',
                    child: Row(
                      children: [
                        Icon(
                          Icons.verified_user_outlined,
                          size: 20,
                          color: AppColors.onBackground.withValues(alpha: 0.85),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '50/50 Shared Agreement',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  PendingUnlockDetailCard(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color: AppColors.onBackground.withValues(alpha: 0.7),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'By accepting, you agree to the distribution of '
                            '\$1,250.75 according to your pre-set agreements. '
                            'This action is final and will move funds to your '
                            'linked accounts.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 13,
                              height: 1.45,
                              color: AppColors.onBackground.withValues(
                                alpha: 0.75,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            label: 'Accept & Unlock',
            onPressed: () => context.pop(),
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Decline Request',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.onBackground,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
