import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_radius.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Large rounded surface showcasing the app logo (welcome screen hero).
class LogoHeroCard extends StatelessWidget {
  const LogoHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.clamp(
          0.0,
          AppSpacing.logoHeroMaxWidth,
        );
        final height = (width * 1.15).clamp(
          0.0,
          AppSpacing.logoHeroMaxHeight,
        );

        return Center(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: AppRadius.cardBorder,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGlow.withValues(alpha: 0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.all(AppSpacing.logoHeroPadding),
            child: Image.asset(
              AppAssets.logo,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
