import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Scenario Two info card for marriage disbursement.
class DisburseMarriageCard extends StatelessWidget {
  const DisburseMarriageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.favorite,
              color: AppColors.onPrimary,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Congratulations!',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onBackground,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Upon marriage, the Love Lock fund will be split equally '
                  'between both partners to celebrate your new journey together.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    height: 1.45,
                    color: AppColors.onBackground.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
