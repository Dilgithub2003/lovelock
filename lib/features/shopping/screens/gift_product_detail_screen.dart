import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/data/shopping_product_details.dart';
import 'package:love_lock/features/shopping/models/gift_product_detail.dart';
import 'package:love_lock/features/shopping/widgets/gift_product_spec_tile.dart';
import 'package:love_lock/features/shopping/widgets/gift_product_style_swatches.dart';

/// Gift product detail template screen.
class GiftProductDetailScreen extends StatefulWidget {
  const GiftProductDetailScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  factory GiftProductDetailScreen.fromArgs(GiftProductDetailArgs? args) {
    return GiftProductDetailScreen(
      productId: args?.productId ?? '',
    );
  }

  @override
  State<GiftProductDetailScreen> createState() =>
      _GiftProductDetailScreenState();
}

class _GiftProductDetailScreenState extends State<GiftProductDetailScreen> {
  int _selectedStyle = 0;

  GiftProductDetail? get _detail =>
      ShoppingProductDetails.detailFor(widget.productId);

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
                    'Product not found',
                    style: TextStyle(color: AppColors.onBackground),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final product = detail.product;
    final serifStyle = GoogleFonts.playfairDisplay(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: AppColors.onBackground,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
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
                    'Gifts',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.onBackgroundAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      color: AppColors.onBackgroundAccent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ProductHeroImage(imageAsset: product.imageAsset),
                    const SizedBox(height: AppSpacing.sectionMd),
                    Row(
                      children: [
                        Text(
                          detail.editionLabel,
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 11,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onBackground.withValues(
                              alpha: 0.55,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                detail.rating.toStringAsFixed(1),
                                style: theme.textTheme.labelMedium?.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.onBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: AppColors.onBackground,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${detail.priceUsd}',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            'or ${_formatPoints(product.lovePoints)} Love Points',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                              color: AppColors.onBackground.withValues(
                                alpha: 0.55,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    Text(
                      'SELECT STYLE',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 11,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onBackground.withValues(alpha: 0.55),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GiftProductStyleSwatches(
                      colors: detail.styleColors,
                      selectedIndex: _selectedStyle,
                      onSelected: (index) =>
                          setState(() => _selectedStyle = index),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    _PurchaseButton(onPressed: () {}),
                    const SizedBox(height: AppSpacing.sectionLg),
                    Text(detail.craftsmanshipHeading, style: serifStyle),
                    const SizedBox(height: 10),
                    Text(
                      detail.craftsmanshipBody,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        height: 1.55,
                        color: AppColors.onBackground.withValues(alpha: 0.55),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.35,
                      children: detail.specs
                          .map((spec) => GiftProductSpecTile(spec: spec))
                          .toList(),
                    ),
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

class _ProductHeroImage extends StatelessWidget {
  const _ProductHeroImage({required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.85,
              colors: [
                AppColors.primary.withValues(alpha: 0.25),
                AppColors.background,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PurchaseButton extends StatelessWidget {
  const _PurchaseButton({this.onPressed});

  final VoidCallback? onPressed;

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
        onPressed: onPressed,
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
          'Purchase with Love Lock',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
