import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/dashboard/models/dashboard_tab.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_scaffold.dart';
import 'package:love_lock/features/love_locker/models/confirm_payment_args.dart';
import 'package:love_lock/features/love_locker/models/fund_amount_option.dart';
import 'package:love_lock/features/love_locker/widgets/amount_option_card.dart';
import 'package:love_lock/features/love_locker/widgets/payment_method_tile.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Add funds screen (UI-only).
class AddFundsScreen extends StatefulWidget {
  const AddFundsScreen({super.key});

  @override
  State<AddFundsScreen> createState() => _AddFundsScreenState();
}

class _AddFundsScreenState extends State<AddFundsScreen> {
  final _customAmountController = TextEditingController();

  static const _presetAmounts = [50.0, 100.0, 200.0];

  static const _amountOptions = [
    FundAmountOption(amountLabel: 'LKR500', pointsLabel: '50 Love Points'),
    FundAmountOption(amountLabel: 'LKR1000', pointsLabel: '100 Love Points'),
    FundAmountOption(amountLabel: 'LKR5000', pointsLabel: '200 Love Points'),
    FundAmountOption(
      amountLabel: 'Custom',
      pointsLabel: 'Enter amount',
      isCustom: true,
    ),
  ];

  int _selectedAmountIndex = 0;
  PaymentMethod _paymentMethod = PaymentMethod.creditCard;

  @override
  void dispose() {
    _customAmountController.dispose();
    super.dispose();
  }

  double _resolveAmount() {
    final option = _amountOptions[_selectedAmountIndex];
    if (option.isCustom) {
      final parsed = double.tryParse(_customAmountController.text.trim());
      return parsed != null && parsed > 0 ? parsed : 0;
    }
    return _presetAmounts[_selectedAmountIndex];
  }

  void _onConfirm(BuildContext context) {
    final amount = _resolveAmount();
    if (amount <= 0) return;

    context.push(
      AppRoutes.confirmPayment,
      extra: ConfirmPaymentArgs(
        amount: amount,
        paymentMethod: _paymentMethod,
      ),
    );
  }

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
                  'Add Funds',
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
                  _SectionLabel(title: 'CHOOSE AMOUNT'),
                  const SizedBox(height: AppSpacing.sectionSm),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.35,
                    children: List.generate(_amountOptions.length, (index) {
                      final option = _amountOptions[index];
                      return AmountOptionCard(
                        amountLabel: option.amountLabel,
                        pointsLabel: option.pointsLabel,
                        isCustom: option.isCustom,
                        isSelected: _selectedAmountIndex == index,
                        onTap: () =>
                            setState(() => _selectedAmountIndex = index),
                      );
                    }),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const _SectionLabel(title: 'CUSTOM AMOUNT'),
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
                  TextField(
                    controller: _customAmountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 18,
                      color: AppColors.onBackground,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        child: Text(
                          '\$',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                      hintText: '0.00',
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        color: AppColors.onBackground.withValues(alpha: 0.4),
                      ),
                      filled: true,
                      fillColor: AppColors.surfaceMuted,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 16,
                      ),
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
            label: 'Confirm & Add Funds',
            onPressed: () => _onConfirm(context),
          ),
        ],
      ),
    );
  }

  void _onTabSelected(BuildContext context, DashboardTab tab) {
    context.go(AppRoutes.dashboard);
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
            color: AppColors.onBackground.withValues(alpha: 0.55),
          ),
    );
  }
}
