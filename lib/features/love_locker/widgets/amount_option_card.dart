import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Selectable amount tile in the Add Funds grid.
class AmountOptionCard extends StatelessWidget {
  const AmountOptionCard({
    super.key,
    required this.amountLabel,
    required this.pointsLabel,
    required this.isSelected,
    required this.onTap,
    this.isCustom = false,
  });

  final String amountLabel;
  final String pointsLabel;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCustom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: isSelected ? AppColors.primary : AppColors.surfaceMuted,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: isSelected
                ? Border.all(color: AppColors.onPrimary, width: 1.5)
                : null,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Stack(
            children: [
              if (isSelected)
                const Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.onPrimary,
                    size: 20,
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    amountLabel,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: isCustom ? 18 : 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onBackground,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    pointsLabel,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: isSelected
                          ? AppColors.onPrimary.withValues(alpha: 0.9)
                          : AppColors.onBackground.withValues(alpha: 0.55),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
