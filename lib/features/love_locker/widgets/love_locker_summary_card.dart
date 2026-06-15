import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Hero summary card at the top of the Love Locker screen.
class LoveLockerSummaryCard extends StatelessWidget {
  const LoveLockerSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: AppColors.surfaceMuted,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              SizedBox(
                width: 68,
                height: 52,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: _ProfileAvatar(imageAsset: AppAssets.maleProfile),
                    ),
                    Positioned(
                      left: 28,
                      child: _ProfileAvatar(imageAsset: AppAssets.femaleProfile),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Love Locker',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onBackground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Sophia & Ethan · Shared Fund',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 13,
                        color: AppColors.onBackground.withValues(alpha: 0.55),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.primary,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.surfaceMuted, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGlow.withValues(alpha: 0.5),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          imageAsset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
