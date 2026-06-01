import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/love_locker/models/breakup_disburse_option.dart';
import 'package:love_lock/features/love_locker/widgets/disburse_marriage_card.dart';
import 'package:love_lock/features/love_locker/widgets/disburse_policy_option_tile.dart';
import 'package:love_lock/features/love_locker/widgets/disburse_scenario_header.dart';
import 'package:love_lock/features/love_locker/widgets/disburse_security_badge.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Fund disbursement policy screen (UI-only).
class DisbursePolicyScreen extends StatefulWidget {
  const DisbursePolicyScreen({super.key});

  @override
  State<DisbursePolicyScreen> createState() => _DisbursePolicyScreenState();
}

class _DisbursePolicyScreenState extends State<DisbursePolicyScreen> {
  BreakupDisburseOption _breakupOption =
      BreakupDisburseOption.onePartnerInitiates;

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
                  'Vouchers',
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
                  Text(
                    'How to Disburse Your Fund',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onBackground,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  Text(
                    'We understand that life can take unexpected turns. '
                    "Here's how your Love Lock fund will be disbursed in "
                    'different scenarios.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.onBackground.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  const DisburseScenarioHeader(label: 'SCENARIO ONE'),
                  const SizedBox(height: AppSpacing.sectionSm),
                  Text(
                    'In Case of a Breakup',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onBackground,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  DisbursePolicyOptionTile(
                    title: 'One Partner Initiates',
                    description:
                        'If one partner decides to end the relationship, '
                        'the entire Love Lock fund will be transferred to '
                        'the other partner.',
                    isSelected: _breakupOption ==
                        BreakupDisburseOption.onePartnerInitiates,
                    onTap: () => setState(
                      () => _breakupOption =
                          BreakupDisburseOption.onePartnerInitiates,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DisbursePolicyOptionTile(
                    title: 'Mutual Agreement',
                    description:
                        'If both partners agree to end the relationship, '
                        'the Love Lock fund will be split equally between '
                        'both partners.',
                    isSelected:
                        _breakupOption == BreakupDisburseOption.mutualAgreement,
                    onTap: () => setState(
                      () => _breakupOption =
                          BreakupDisburseOption.mutualAgreement,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  const DisburseScenarioHeader(label: 'SCENARIO TWO'),
                  const SizedBox(height: AppSpacing.sectionSm),
                  Text(
                    'Upon Marriage',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onBackground,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  const DisburseMarriageCard(),
                  const SizedBox(height: AppSpacing.sectionLg),
                  const Row(
                    children: [
                      DisburseSecurityBadge(
                        icon: Icons.shield_outlined,
                        label: 'GUARANTEED\nSAFETY',
                      ),
                      SizedBox(width: 12),
                      DisburseSecurityBadge(
                        icon: Icons.lock_person_outlined,
                        label: 'DUAL CONSENT\nREQUIRED',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            label: 'Confirm & Continue',
            onPressed: () => _onConfirm(context),
          ),
        ],
      ),
    );
  }

  void _onConfirm(BuildContext context) {
    if (_breakupOption == BreakupDisburseOption.mutualAgreement) {
      context.push(AppRoutes.unlockRequest);
      return;
    }
    context.pop();
  }

  void _onTabSelected(BuildContext context, DashboardTab tab) {
    context.go(AppRoutes.dashboard);
  }
}
