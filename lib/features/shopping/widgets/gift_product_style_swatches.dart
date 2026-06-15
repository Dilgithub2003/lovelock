import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Circular style swatches for gift product detail.
class GiftProductStyleSwatches extends StatelessWidget {
  const GiftProductStyleSwatches({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<Color> colors;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < colors.length; i++) ...[
          if (i > 0) const SizedBox(width: 14),
          GestureDetector(
            onTap: () => onSelected(i),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[i],
                border: Border.all(
                  color: i == selectedIndex
                      ? AppColors.onBackground
                      : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
