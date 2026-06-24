import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/core/widgets/screen_back_header.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/love_locker/models/borrow_destination.dart';
import 'package:love_lock/features/love_locker/widgets/borrow_destination_card.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Borrow funds screen (UI-only).
class BorrowFundsScreen extends StatefulWidget {
  const BorrowFundsScreen({super.key});

  @override
  State<BorrowFundsScreen> createState() => _BorrowFundsScreenState();
}

class _BorrowFundsScreenState extends State<BorrowFundsScreen> {
  static const _availableCredit = 5000.0;
  static const _processingFeeRate = 0.0;

  static const _destinations = [
    BorrowDestination(
      title: 'Chase Savings',
      subtitle: '**** 1234 • Exp 05/27',
      icon: Icons.account_balance_rounded,
    ),
    BorrowDestination(
      title: 'Apple Card',
      subtitle: '**** 8821 • Exp 09/25',
      icon: Icons.credit_card_rounded,
    ),
  ];

  final _amountController = TextEditingController();
  int _selectedDestination = 0;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  double get _principal {
    final parsed = double.tryParse(_amountController.text.trim());
    return parsed != null && parsed > 0 ? parsed : 0;
  }

  double get _processingFee => _principal * _processingFeeRate;

  double get _totalRepay => _principal + _processingFee;

  String _formatLkr(double value) {
    if (value == value.truncateToDouble()) {
      return 'LKR${value.toStringAsFixed(0)}.00';
    }
    return 'LKR${value.toStringAsFixed(2)}';
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
          ScreenBackHeader(
            title: 'Borrow Funds',
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded),
              color: AppColors.onBackgroundAccent,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _SectionLabel(title: 'REQUESTED AMOUNT'),
                  const SizedBox(height: AppSpacing.sectionSm),
                  TextField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                    ],
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onBackground.withValues(alpha: 0.45),
                    ),
                    decoration: InputDecoration(
                      hintText: 'LKR 0.00',
                      hintStyle: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onBackground.withValues(alpha: 0.35),
                      ),
                      filled: true,
                      fillColor: AppColors.surfaceMuted,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Available credit: \$${_availableCredit.toStringAsFixed(2)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: AppColors.primary.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  const _SectionLabel(title: 'DISBURSEMENT DESTINATION'),
                  const SizedBox(height: AppSpacing.sectionSm),
                  ...List.generate(_destinations.length, (index) {
                    final dest = _destinations[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index < _destinations.length - 1 ? 10 : 0,
                      ),
                      child: BorrowDestinationCard(
                        title: dest.title,
                        subtitle: dest.subtitle,
                        icon: dest.icon,
                        isSelected: _selectedDestination == index,
                        onTap: () =>
                            setState(() => _selectedDestination = index),
                      ),
                    );
                  }),
                  const SizedBox(height: AppSpacing.sectionLg),
                  const _BorrowingTermsCard(),
                  const SizedBox(height: AppSpacing.sectionLg),
                  const _SectionLabel(title: 'REQUEST SUMMARY'),
                  const SizedBox(height: AppSpacing.sectionSm),
                  _RequestSummaryCard(
                    principal: _formatLkr(_principal),
                    processingFee: _formatLkr(_processingFee),
                    total: _formatLkr(_totalRepay),
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            label: 'Request Funds',
            onPressed: _principal > 0 ? () {} : null,
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
            color: AppColors.primary,
          ),
    );
  }
}

class _BorrowingTermsCard extends StatelessWidget {
  const _BorrowingTermsCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'BORROWING TERMS',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.info_outline_rounded,
                size: 18,
                color: AppColors.onBackground.withValues(alpha: 0.4),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'REPAYMENT DATE',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 10,
              letterSpacing: 0.6,
              fontWeight: FontWeight.w600,
              color: AppColors.onBackground.withValues(alpha: 0.45),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Dec 15, 2024',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.onBackground,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Funds are usually available within 24 hours. Early repayment '
            'carries no additional penalties.',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              height: 1.45,
              color: AppColors.onBackground.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestSummaryCard extends StatelessWidget {
  const _RequestSummaryCard({
    required this.principal,
    required this.processingFee,
    required this.total,
  });

  final String principal;
  final String processingFee;
  final String total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _SummaryRow(
            label: 'Principal Amount',
            value: principal,
            theme: theme,
          ),
          const SizedBox(height: 12),
          _SummaryRow(
            label: 'Processing Fee',
            value: processingFee,
            theme: theme,
          ),
          const SizedBox(height: 12),
          Divider(
            height: 1,
            color: AppColors.onBackground.withValues(alpha: 0.12),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total to Repay',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onBackground,
                ),
              ),
              Text(
                total,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 16,
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
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 13,
            color: AppColors.onBackground.withValues(alpha: 0.5),
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.onBackground,
          ),
        ),
      ],
    );
  }
}
