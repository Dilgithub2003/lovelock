import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/data/shopping_sample_data.dart';
import 'package:love_lock/features/shopping/models/digital_good.dart';
import 'package:love_lock/features/shopping/models/voucher_category.dart';
import 'package:love_lock/features/shopping/widgets/voucher_category_chips.dart';
import 'package:love_lock/features/shopping/widgets/voucher_gallery_card.dart';
import 'package:love_lock/features/shopping/widgets/vouchers_balance_badge.dart';

/// Full vouchers gallery — linked from shopping "See all" on Gift Vouchers.
class DigitalGoodsScreen extends StatefulWidget {
  const DigitalGoodsScreen({super.key});

  @override
  State<DigitalGoodsScreen> createState() => _DigitalGoodsScreenState();
}

class _DigitalGoodsScreenState extends State<DigitalGoodsScreen> {
  VoucherCategory _category = VoucherCategory.dining;

  List<DigitalGood> get _visibleVouchers {
    return ShoppingSampleData.catalogVouchers
        .where((item) => item.category == _category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'CURATED COLLECTION',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 11,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Discover Vouchers',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              color: AppColors.onBackground,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sectionMd),
                          const Center(child: VouchersBalanceBadge()),
                          const SizedBox(height: AppSpacing.sectionLg),
                          VoucherCategoryChips(
                            selected: _category,
                            onSelected: (value) =>
                                setState(() => _category = value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: EdgeInsets.only(
                            bottom: index < _visibleVouchers.length - 1
                                ? 16
                                : 0,
                          ),
                          child: VoucherGalleryCard(
                            voucher: _visibleVouchers[index],
                          ),
                        ),
                        childCount: _visibleVouchers.length,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    sliver: SliverToBoxAdapter(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor:
                              AppColors.onBackground.withValues(alpha: 0.7),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'EXPLORE MORE CATEGORIES',
                              style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                          ],
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
    );
  }
}
