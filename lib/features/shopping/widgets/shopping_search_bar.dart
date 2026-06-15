import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Rounded search field for the shopping catalog.
class ShoppingSearchBar extends StatelessWidget {
  const ShoppingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: AppColors.onBackground,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        hintText: 'Search for gifts',
        hintStyle: TextStyle(
          color: AppColors.onBackground.withValues(alpha: 0.45),
          fontSize: 15,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: AppColors.onBackground.withValues(alpha: 0.45),
        ),
        filled: true,
        fillColor: AppColors.surfaceMuted,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
