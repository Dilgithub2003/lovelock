import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Secondary CTA at the bottom of catalog screens.
class RevealMoreTreasuresButton extends StatelessWidget {
  const RevealMoreTreasuresButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.onBackground.withValues(alpha: 0.75),
          backgroundColor: AppColors.surfaceMuted,
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Text(
          'REVEAL MORE TREASURES',
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
