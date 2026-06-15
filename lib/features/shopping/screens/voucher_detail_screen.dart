import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/data/shopping_voucher_details.dart';
import 'package:love_lock/features/shopping/models/voucher_detail.dart';

/// Voucher detail screen — redemption info and terms.
class VoucherDetailScreen extends StatelessWidget {
  const VoucherDetailScreen({
    super.key,
    required this.voucherId,
  });

  final String voucherId;

  factory VoucherDetailScreen.fromArgs(VoucherDetailArgs? args) {
    return VoucherDetailScreen(voucherId: args?.voucherId ?? '');
  }

  VoucherDetail? get _detail => ShoppingVoucherDetails.detailFor(voucherId);

  String _formatPoints(int points) {
    final text = points.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      final fromEnd = text.length - i;
      buffer.write(text[i]);
      if (fromEnd > 1 && fromEnd % 3 == 1) {
        buffer.write(',');
      }
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final detail = _detail;
    final theme = Theme.of(context);

    if (detail == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
                color: AppColors.onBackgroundAccent,
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Voucher not found',
                    style: TextStyle(color: AppColors.onBackground),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
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
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _VoucherHero(detail: detail),
                    const SizedBox(height: AppSpacing.sectionLg),
                    Text(
                      'REDEMPTION PRICE',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 11,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onBackground.withValues(alpha: 0.45),
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.onBackground,
                        ),
                        children: [
                          TextSpan(
                            text: _formatPoints(detail.voucher.lovePoints),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: 'LOVE POINTS',
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    _VaultStatusCard(status: detail.vaultStatus),
                    const SizedBox(height: AppSpacing.sectionMd),
                    const _BuyVoucherButton(),
                    const SizedBox(height: AppSpacing.sectionLg),
                    _HowToUseCard(steps: detail.howToUseSteps),
                    const SizedBox(height: AppSpacing.sectionMd),
                    _ValidityRow(validityText: detail.validityText),
                    const SizedBox(height: AppSpacing.sectionLg),
                    _TermsSection(terms: detail.terms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VoucherHero extends StatelessWidget {
  const _VoucherHero({required this.detail});

  final VoucherDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 240,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              detail.voucher.backgroundAsset,
              fit: BoxFit.cover,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.1),
                    Colors.black.withValues(alpha: 0.55),
                    Colors.black.withValues(alpha: 0.88),
                  ],
                  stops: const [0.35, 0.7, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5C1A32).withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          detail.categoryIcon,
                          size: 14,
                          color: AppColors.onBackground,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          detail.categoryTag,
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 9,
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.w700,
                            color: AppColors.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    detail.heroTitle,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
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

class _VaultStatusCard extends StatelessWidget {
  const _VaultStatusCard({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5C1A32),
            Color(0xFF2A1020),
            Color(0xFF121212),
          ],
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.confirmation_number_outlined,
            size: 28,
            color: AppColors.onBackground.withValues(alpha: 0.85),
          ),
          const SizedBox(height: 10),
          Text(
            'VAULT STATUS',
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 10,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              color: AppColors.onBackground.withValues(alpha: 0.55),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            status,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuyVoucherButton extends StatelessWidget {
  const _BuyVoucherButton();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGlow,
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Text(
          'Buy voucher with love',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _HowToUseCard extends StatelessWidget {
  const _HowToUseCard({required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          left: BorderSide(
            color: AppColors.primary,
            width: 3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_fix_high_outlined,
                size: 18,
                color: AppColors.onBackground.withValues(alpha: 0.8),
              ),
              const SizedBox(width: 8),
              Text(
                'HOW TO USE',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 11,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onBackground,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < steps.length; i++) ...[
            if (i > 0) const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceMuted,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${i + 1}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onBackground.withValues(alpha: 0.7),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      steps[i],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        height: 1.5,
                        color: AppColors.onBackground.withValues(alpha: 0.65),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _ValidityRow extends StatelessWidget {
  const _ValidityRow({required this.validityText});

  final String validityText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VALIDITY',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  validityText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onBackground,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.calendar_today_outlined,
            size: 22,
            color: AppColors.onBackground.withValues(alpha: 0.45),
          ),
        ],
      ),
    );
  }
}

class _TermsSection extends StatelessWidget {
  const _TermsSection({required this.terms});

  final List<String> terms;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.gavel_outlined,
              size: 18,
              color: AppColors.onBackground.withValues(alpha: 0.8),
            ),
            const SizedBox(width: 8),
            Text(
              'TERMS & CONDITIONS',
              style: theme.textTheme.labelSmall?.copyWith(
                fontSize: 11,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w700,
                color: AppColors.onBackground,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        for (final term in terms)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.onBackground.withValues(alpha: 0.4),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    term,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      height: 1.5,
                      color: AppColors.onBackground.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
