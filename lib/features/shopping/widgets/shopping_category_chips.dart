import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/models/shopping_category.dart';

/// Horizontal category filter chips for the shopping screen.
class ShoppingCategoryChips extends StatelessWidget {
  const ShoppingCategoryChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final ShoppingCategory selected;
  final ValueChanged<ShoppingCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ShoppingCategory.values.map((category) {
          final isActive = category == selected;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FilterChip(
              label: Text(category.label),
              selected: isActive,
              onSelected: (_) => onSelected(category),
              showCheckmark: false,
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? AppColors.onPrimary
                    : AppColors.onBackground.withValues(alpha: 0.55),
              ),
              backgroundColor: AppColors.surfaceMuted,
              selectedColor: AppColors.primary,
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
