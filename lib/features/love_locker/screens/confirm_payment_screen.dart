import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/love_locker/models/confirm_payment_args.dart';
import 'package:love_lock/features/love_locker/widgets/payment_method_tile.dart';

/// Add funds payment confirmation screen (UI-only).
class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({
    super.key,
    this.amount = 50,
    this.serviceFee = 0,
    this.paymentMethod = PaymentMethod.creditCard,
  });

  final double amount;
  final double serviceFee;
  final PaymentMethod paymentMethod;

  factory ConfirmPaymentScreen.fromArgs(ConfirmPaymentArgs? args) {
    if (args == null) {
      return const ConfirmPaymentScreen();
    }
    return ConfirmPaymentScreen(
      amount: args.amount,
      serviceFee: args.serviceFee,
      paymentMethod: args.paymentMethod,
    );
  }

  double get _total => amount + serviceFee;

  String _formatMoney(double value) => '\$${value.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isApplePay = paymentMethod == PaymentMethod.applePay;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 8, 4),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back),
                      color: AppColors.onBackgroundAccent,
                    ),
                  ),
                  Text(
                    'Confirm Payment',
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
                    const _ConfirmPaymentHeroCard(),
                    const SizedBox(height: AppSpacing.sectionMd),
                    _SummaryCard(
                      amountLabel: _formatMoney(amount),
                      serviceFeeLabel: _formatMoney(serviceFee),
                      totalLabel: _formatMoney(_total),
                    ),
                    const SizedBox(height: AppSpacing.sectionSm),
                    _PaymentMethodSummaryCard(
                      title: isApplePay ? 'Apple Pay' : 'Mastercard',
                      subtitle: isApplePay ? 'Wallet' : '•••• 1234',
                      isApplePay: isApplePay,
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    const _SecurePaymentBadge(),
                    const SizedBox(height: AppSpacing.sectionSm),
                    Text(
                      'Your data is encrypted using military-grade protocols. '
                      'No transaction details are stored on this device.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        height: 1.45,
                        color: AppColors.onBackground.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              label: 'PAY NOW',
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConfirmPaymentHeroCard extends StatelessWidget {
  const _ConfirmPaymentHeroCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A2A35),
              Color(0xFF134E5E),
              Color(0xFF1A6B7A),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -40,
              top: -20,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF2DD4BF).withValues(alpha: 0.15),
                ),
              ),
            ),
            Positioned(
              left: -30,
              bottom: -40,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'SECURE TRANSACTION',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Protecting Your\nShared Future',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                      color: AppColors.onBackground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.amountLabel,
    required this.serviceFeeLabel,
    required this.totalLabel,
  });

  final String amountLabel;
  final String serviceFeeLabel;
  final String totalLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _SummaryRow(
            label: 'Amount to Add',
            value: amountLabel,
            theme: theme,
          ),
          const SizedBox(height: 14),
          _SummaryRow(
            label: 'Service Fee',
            value: serviceFeeLabel,
            theme: theme,
          ),
          const SizedBox(height: 14),
          Divider(
            height: 1,
            color: AppColors.onBackground.withValues(alpha: 0.12),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBackground,
                ),
              ),
              Text(
                totalLabel,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    required this.theme,
  });

  final String label;
  final String value;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            color: AppColors.onBackground.withValues(alpha: 0.85),
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.onBackground,
          ),
        ),
      ],
    );
  }
}

class _PaymentMethodSummaryCard extends StatelessWidget {
  const _PaymentMethodSummaryCard({
    required this.title,
    required this.subtitle,
    this.isApplePay = false,
  });

  final String title;
  final String subtitle;
  final bool isApplePay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Icon(
              isApplePay ? Icons.apple : Icons.credit_card_rounded,
              color: AppColors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onBackground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    color: AppColors.onBackground.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'CHANGE',
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SecurePaymentBadge extends StatelessWidget {
  const _SecurePaymentBadge();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceMuted,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_outline, color: AppColors.primary, size: 16),
            const SizedBox(width: 8),
            Text(
              'SECURE PAYMENT SECURED BY SANCTUARY',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 9,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
