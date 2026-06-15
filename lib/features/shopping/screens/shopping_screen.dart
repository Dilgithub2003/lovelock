import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:love_lock/features/shopping/data/shopping_sample_data.dart';
import 'package:love_lock/features/shopping/models/shopping_category.dart';
import 'package:love_lock/features/shopping/widgets/digital_good_card.dart';
import 'package:love_lock/features/shopping/widgets/gift_experience_card.dart';
import 'package:love_lock/features/shopping/widgets/gift_product_card.dart';
import 'package:love_lock/features/shopping/widgets/shopping_category_chips.dart';
import 'package:love_lock/features/shopping/widgets/shopping_search_bar.dart';
import 'package:love_lock/features/shopping/widgets/shopping_section_header.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Shopping tab — gift experiences, products, and digital goods.
class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({
    super.key,
    required this.onOpenSettings,
  });

  final VoidCallback onOpenSettings;

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  ShoppingCategory _category = ShoppingCategory.all;

  bool get _showExperiences =>
      _category == ShoppingCategory.all ||
      _category == ShoppingCategory.experiences;

  bool get _showProducts => _category == ShoppingCategory.all;

  bool get _showVouchers =>
      _category == ShoppingCategory.all ||
      _category == ShoppingCategory.digitalGoods;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardTopBar(onSettingsTap: widget.onOpenSettings),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ShoppingSearchBar(),
                const SizedBox(height: AppSpacing.sectionMd),
                ShoppingCategoryChips(
                  selected: _category,
                  onSelected: (value) => setState(() => _category = value),
                ),
                if (_showExperiences) ...[
                  const SizedBox(height: AppSpacing.sectionLg),
                  ShoppingSectionHeader(
                    title: 'Gift Experiences',
                    onSeeAll: () =>
                        context.push(AppRoutes.giftExperiences),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0;
                            i < ShoppingSampleData.experiences.length;
                            i++) ...[
                          if (i > 0) const SizedBox(width: 16),
                          GiftExperienceCard(
                            experience: ShoppingSampleData.experiences[i],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
                if (_showProducts) ...[
                  const SizedBox(height: AppSpacing.sectionLg),
                  ShoppingSectionHeader(
                    title: 'Gift Products',
                    onSeeAll: () => context.push(AppRoutes.giftProducts),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0;
                            i < ShoppingSampleData.products.length;
                            i++) ...[
                          if (i > 0) const SizedBox(width: 16),
                          GiftProductCard(
                            product: ShoppingSampleData.products[i],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
                if (_showVouchers) ...[
                  const SizedBox(height: AppSpacing.sectionLg),
                  ShoppingSectionHeader(
                    title: 'Gift Vouchers',
                    onSeeAll: () => context.push(AppRoutes.digitalGoods),
                  ),
                  const SizedBox(height: AppSpacing.sectionSm),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0;
                            i < ShoppingSampleData.digitalGoods.length;
                            i++) ...[
                          if (i > 0) const SizedBox(width: 16),
                          DigitalGoodCard(
                            item: ShoppingSampleData.digitalGoods[i],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
