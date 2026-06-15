import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Partner pairing visualization at the top of Linked Accounts.
class LinkedAccountsPartnerHeader extends StatelessWidget {
  const LinkedAccountsPartnerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.1,
          colors: [
            AppColors.primary.withValues(alpha: 0.12),
            AppColors.background,
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProfileBubble(label: 'YOU', imageAsset: AppAssets.maleProfile),
              const SizedBox(width: 8),
              Container(
                width: 40,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.link_rounded,
                  color: AppColors.onBackground.withValues(alpha: 0.85),
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              _ProfileBubble(
                label: 'SARAH',
                imageAsset: AppAssets.femaleProfile,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sectionMd),
          Text(
            'Your love lock is active',
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.onBackground,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'SECURED SINCE DEC 2023',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.w600,
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

class _ProfileBubble extends StatelessWidget {
  const _ProfileBubble({
    required this.label,
    required this.imageAsset,
  });

  final String label;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryGlow,
                blurRadius: 16,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(imageAsset, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: AppColors.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
