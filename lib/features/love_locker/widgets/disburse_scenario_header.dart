import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Pink "SCENARIO N" label with trailing divider line.
class DisburseScenarioHeader extends StatelessWidget {
  const DisburseScenarioHeader({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 11,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.onBackground.withValues(alpha: 0.2),
          ),
        ),
      ],
    );
  }
}
