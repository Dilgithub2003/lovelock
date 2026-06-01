import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/love_locker/models/unlock_reason.dart';
import 'package:love_lock/features/love_locker/widgets/unlock_reason_card.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Unlock request confirmation screen after mutual disburse policy (UI-only).
class UnlockRequestScreen extends StatefulWidget {
  const UnlockRequestScreen({super.key});

  @override
  State<UnlockRequestScreen> createState() => _UnlockRequestScreenState();
}

class _UnlockRequestScreenState extends State<UnlockRequestScreen> {
  UnlockReason _selectedReason = UnlockReason.mutualSettlement;

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
                  'Unlock',
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
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                        color: AppColors.onBackground,
                      ),
                      children: const [
                        TextSpan(text: 'Begin the\n'),
                        TextSpan(
                          text: 'Final Chapter',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  Text(
                    'Select a reason to initiate the unlocking of your '
                    'shared sanctuary. This request will be sent to your '
                    'partner for confirmation.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.onBackground.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  UnlockReasonCard(
                    title: 'The Big Day',
                    description:
                        'Celebrate your union by unlocking your future together.',
                    icon: const UnlockReasonHeartIcon(),
                    showUnionBadge: true,
                    isSelected: _selectedReason == UnlockReason.theBigDay,
                    onTap: () =>
                        setState(() => _selectedReason = UnlockReason.theBigDay),
                  ),
                  const SizedBox(height: 12),
                  UnlockReasonCard(
                    title: 'Mutual Settlement',
                    description:
                        'A collaborative adjustment of your shared assets.',
                    icon: const UnlockReasonCircleIcon(
                      icon: Icons.balance_rounded,
                    ),
                    isSelected:
                        _selectedReason == UnlockReason.mutualSettlement,
                    onTap: () => setState(
                      () => _selectedReason = UnlockReason.mutualSettlement,
                    ),
                  ),
                  const SizedBox(height: 12),
                  UnlockReasonCard(
                    title: 'Parting Ways',
                    description:
                        'Distribute funds according to your split agreement.',
                    icon: const UnlockReasonCircleIcon(
                      icon: Icons.heart_broken_rounded,
                    ),
                    isSelected: _selectedReason == UnlockReason.partingWays,
                    onTap: () => setState(
                      () => _selectedReason = UnlockReason.partingWays,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  Text(
                    'PERSONAL NOTE (OPTIONAL)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 11,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  TextField(
                    maxLines: 4,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: AppColors.onBackground,
                    ),
                    decoration: InputDecoration(
                      hintText: 'A message to accompany the request...',
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.onBackground.withValues(alpha: 0.4),
                      ),
                      filled: true,
                      fillColor: AppColors.surfaceMuted,
                      contentPadding: const EdgeInsets.all(16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            label: 'Send Unlock Request',
            onPressed: () => context.push(AppRoutes.pendingUnlock),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              'REQUIRES PARTNER APPROVAL WITHIN 48 HOURS',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 10,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
                color: AppColors.onBackground.withValues(alpha: 0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTabSelected(BuildContext context, DashboardTab tab) {
    context.go(AppRoutes.dashboard);
  }
}
