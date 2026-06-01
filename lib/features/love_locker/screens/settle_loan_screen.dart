import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/love_locker/models/confirm_payment_args.dart';
import 'package:love_lock/features/love_locker/widgets/payment_method_tile.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Pending loan settlement screen (UI-only).
class SettleLoanScreen extends StatefulWidget {
  const SettleLoanScreen({
    super.key,
    this.pendingAmount = 1250.75,
  });

  /// Outstanding loan balance to settle.
  final double pendingAmount;

  @override
  State<SettleLoanScreen> createState() => _SettleLoanScreenState();
}

class _SettleLoanScreenState extends State<SettleLoanScreen> {
  PaymentMethod _paymentMethod = PaymentMethod.creditCard;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final amountLabel = widget.pendingAmount.toStringAsFixed(2);

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
                  'Loan',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const _SectionLabel(title: 'PENDING LOAN'),
                      Text(
                        '1 USD = 10 Love Points',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onBackground.withValues(alpha: 0.55),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceMuted,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '\$',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          amountLabel,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onBackground.withValues(
                              alpha: 0.45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  const _SectionLabel(title: 'PAYMENT METHOD'),
                  const SizedBox(height: AppSpacing.sectionSm),
                  PaymentMethodTile(
                    label: 'Credit Card',
                    icon: const Icon(
                      Icons.credit_card_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                    isSelected: _paymentMethod == PaymentMethod.creditCard,
                    onTap: () => setState(
                      () => _paymentMethod = PaymentMethod.creditCard,
                    ),
                  ),
                  const SizedBox(height: 10),
                  PaymentMethodTile(
                    label: 'Apple Pay',
                    icon: Icon(
                      Icons.apple,
                      color: AppColors.onBackground.withValues(alpha: 0.85),
                      size: 24,
                    ),
                    isSelected: _paymentMethod == PaymentMethod.applePay,
                    onTap: () => setState(
                      () => _paymentMethod = PaymentMethod.applePay,
                    ),
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            label: 'Confirm & Continue',
            onPressed: widget.pendingAmount > 0
                ? () {
                    context.push(
                      AppRoutes.confirmPayment,
                      extra: ConfirmPaymentArgs(
                        amount: widget.pendingAmount,
                        paymentMethod: _paymentMethod,
                      ),
                    );
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 11,
            letterSpacing: 0.8,
            fontWeight: FontWeight.w600,
            color: AppColors.onBackground.withValues(alpha: 0.85),
          ),
    );
  }
}
