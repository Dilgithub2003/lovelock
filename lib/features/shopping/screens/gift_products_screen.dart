import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/data/shopping_sample_data.dart';
import 'package:love_lock/features/shopping/models/gift_product.dart';
import 'package:love_lock/features/shopping/models/gift_product_filter.dart';
import 'package:love_lock/features/shopping/widgets/gift_product_card.dart';
import 'package:love_lock/features/shopping/widgets/gift_product_filter_chips.dart';
import 'package:love_lock/features/shopping/widgets/reveal_more_treasures_button.dart';
import 'package:love_lock/features/shopping/widgets/shopping_gradient_title.dart';
import 'package:love_lock/features/shopping/widgets/shopping_search_bar.dart';

/// Full gifts catalog — linked from shopping "See all" on Gift Products.
class GiftProductsScreen extends StatefulWidget {
  const GiftProductsScreen({super.key});

  @override
  State<GiftProductsScreen> createState() => _GiftProductsScreenState();
}

class _GiftProductsScreenState extends State<GiftProductsScreen> {
  GiftProductFilter _filter = GiftProductFilter.all;

  List<GiftProduct> get _visibleProducts {
    return switch (_filter) {
      GiftProductFilter.all => ShoppingSampleData.catalogProducts,
      GiftProductFilter.experiences => ShoppingSampleData.catalogProducts
          .where((item) => item.type == GiftProductType.experience)
          .toList(),
      GiftProductFilter.physical => ShoppingSampleData.catalogProducts
          .where((item) => item.type == GiftProductType.physical)
          .toList(),
    };
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
                    'Gifts',
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
                          const ShoppingGradientTitle(
                            prefix: 'Gifts of ',
                            highlight: 'Connection',
                          ),
                          const SizedBox(height: AppSpacing.sectionMd),
                          const ShoppingSearchBar(),
                          const SizedBox(height: AppSpacing.sectionMd),
                          GiftProductFilterChips(
                            selected: _filter,
                            onSelected: (value) =>
                                setState(() => _filter = value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 24,
                        childAspectRatio: 0.62,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => GiftProductCard(
                          product: _visibleProducts[index],
                          width: double.infinity,
                        ),
                        childCount: _visibleProducts.length,
                      ),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 24),
                    sliver: SliverToBoxAdapter(
                      child: RevealMoreTreasuresButton(),
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
