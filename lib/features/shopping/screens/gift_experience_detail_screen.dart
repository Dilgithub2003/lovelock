import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/data/shopping_experience_details.dart';
import 'package:love_lock/features/shopping/models/gift_experience_detail.dart';
import 'package:love_lock/features/shopping/widgets/gift_experience_inclusion_tile.dart';

/// Gift experience detail template screen.
class GiftExperienceDetailScreen extends StatelessWidget {
  const GiftExperienceDetailScreen({
    super.key,
    required this.experienceId,
  });

  final String experienceId;

  factory GiftExperienceDetailScreen.fromArgs(GiftExperienceDetailArgs? args) {
    return GiftExperienceDetailScreen(
      experienceId: args?.experienceId ?? '',
    );
  }

  GiftExperienceDetail? get _detail =>
      ShoppingExperienceDetails.detailFor(experienceId);

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
                    'Experience not found',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ExperienceHero(detail: detail),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'INCLUSIONS',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 11,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 14),
                      for (var i = 0; i < detail.inclusions.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        GiftExperienceInclusionTile(
                          inclusion: detail.inclusions[i],
                        ),
                      ],
                      const SizedBox(height: AppSpacing.sectionLg),
                      Text(
                        'THE NARRATIVE',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 11,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 14),
                      for (var i = 0;
                          i < detail.narrativeParagraphs.length;
                          i++) ...[
                        if (i > 0) const SizedBox(height: 14),
                        Text(
                          detail.narrativeParagraphs[i],
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            height: 1.6,
                            color: AppColors.onBackground.withValues(
                              alpha: 0.75,
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: AppSpacing.sectionLg),
                      const _PurchaseButton(),
                      const SizedBox(height: 12),
                      Text(
                        'SECURED BY VELVET VAULT ENCRYPTION',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onBackground.withValues(alpha: 0.35),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
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
          ),
        ],
      ),
    );
  }
}

class _ExperienceHero extends StatelessWidget {
  const _ExperienceHero({required this.detail});

  final GiftExperienceDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final experience = detail.experience;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 440,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                experience.imageAsset,
                fit: BoxFit.cover,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.15),
                      Colors.black.withValues(alpha: 0.35),
                      AppColors.background.withValues(alpha: 0.95),
                      AppColors.background,
                    ],
                    stops: const [0.0, 0.45, 0.82, 1.0],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.favorite_rounded,
                      size: 14,
                      color: AppColors.onPrimary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      detail.badgeLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 10,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Text(
                experience.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  height: 1.15,
                  color: AppColors.onBackground,
                ),
              ),
              const SizedBox(height: 16),
              _SummaryCard(detail: detail),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.detail});

  final GiftExperienceDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.onBackground.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (_) => const Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      detail.rating.toStringAsFixed(1),
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onBackground,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${detail.reviewCount} SHARED REVIEWS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onBackground.withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),
          ),
          Column(
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
              const SizedBox(height: 2),
              Text(
                detail.priceSubtitle,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 9,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBackground.withValues(alpha: 0.45),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PurchaseButton extends StatelessWidget {
  const _PurchaseButton();

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
