import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/models/gift_product_spec.dart';

/// Spec tile for the gift product detail grid.
class GiftProductSpecTile extends StatelessWidget {
  const GiftProductSpecTile({super.key, required this.spec});

  final GiftProductSpec spec;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            spec.icon,
            size: 22,
            color: AppColors.onBackground.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 12),
          Text(
            spec.label,
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 10,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            spec.value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
