import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/models/gift_product_filter.dart';

/// Filter chips for the gifts catalog screen.
class GiftProductFilterChips extends StatelessWidget {
  const GiftProductFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final GiftProductFilter selected;
  final ValueChanged<GiftProductFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: GiftProductFilter.values.map((filter) {
          final isActive = filter == selected;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FilterChip(
              label: Text(filter.label),
              selected: isActive,
              onSelected: (_) => onSelected(filter),
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
