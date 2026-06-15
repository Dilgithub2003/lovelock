import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Points balance badge on the vouchers gallery screen.
class VouchersBalanceBadge extends StatelessWidget {
  const VouchersBalanceBadge({
    super.key,
    this.points = 4280,
  });

  final int points;

  String get _formattedPoints {
    final text = points.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      final fromEnd = text.length - i;
      buffer.write(text[i]);
      if (fromEnd > 1 && fromEnd % 3 == 1) {
        buffer.write(',');
      }
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: AppColors.onBackground.withValues(alpha: 0.08),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.favorite_rounded,
                size: 18,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                _formattedPoints,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onBackground,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'POINTS',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 11,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'BALANCE',
          style: theme.textTheme.labelSmall?.copyWith(
            fontSize: 10,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
