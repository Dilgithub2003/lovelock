import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/data/shopping_sample_data.dart';
import 'package:love_lock/features/shopping/models/shopping_category.dart';
import 'package:love_lock/features/shopping/widgets/digital_good_card.dart';
import 'package:love_lock/features/shopping/widgets/gift_experience_card.dart';
import 'package:love_lock/features/shopping/widgets/reveal_more_treasures_button.dart';
import 'package:love_lock/features/shopping/widgets/shopping_category_chips.dart';
import 'package:love_lock/features/shopping/widgets/shopping_gradient_title.dart';
import 'package:love_lock/features/shopping/widgets/shopping_search_bar.dart';
import 'package:love_lock/features/shopping/widgets/shopping_section_header.dart';

/// Full experience gifts catalog — linked from shopping "See all".
class GiftExperiencesScreen extends StatefulWidget {
  const GiftExperiencesScreen({super.key});

  @override
  State<GiftExperiencesScreen> createState() => _GiftExperiencesScreenState();
}

class _GiftExperiencesScreenState extends State<GiftExperiencesScreen> {
  ShoppingCategory _filter = ShoppingCategory.all;

  bool get _showExperiences =>
      _filter == ShoppingCategory.all ||
      _filter == ShoppingCategory.experiences;

  bool get _showDigitalGoods => _filter == ShoppingCategory.digitalGoods;

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
                    'Experience gifts',
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
                            'CURATED TREASURY',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 11,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onBackground.withValues(
                                alpha: 0.45,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const ShoppingGradientTitle(
                            prefix: 'Gifts of ',
                            highlight: 'Memories',
                          ),
                          const SizedBox(height: AppSpacing.sectionMd),
                          const ShoppingSearchBar(),
                          const SizedBox(height: AppSpacing.sectionMd),
                          ShoppingCategoryChips(
                            selected: _filter,
                            onSelected: (value) =>
                                setState(() => _filter = value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_showExperiences) ...[
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      sliver: SliverToBoxAdapter(
                        child: ShoppingSectionHeader(
                          title: 'Featured Gifts',
                          onSeeAll: () {},
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 24,
                          childAspectRatio: 0.52,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => GiftExperienceCard(
                            experience:
                                ShoppingSampleData.catalogExperiences[index],
                            width: double.infinity,
                          ),
                          childCount:
                              ShoppingSampleData.catalogExperiences.length,
                        ),
                      ),
                    ),
                  ],
                  if (_showDigitalGoods)
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 24,
                          childAspectRatio: 0.85,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => DigitalGoodCard(
                            item: ShoppingSampleData.digitalGoods[index],
                            width: double.infinity,
                          ),
                          childCount: ShoppingSampleData.digitalGoods.length,
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
