import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Compact security highlight card (GUARANTEED SAFETY, etc.).
class DisburseSecurityBadge extends StatelessWidget {
  const DisburseSecurityBadge({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceMuted,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary, size: 28),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 9,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onBackground.withValues(alpha: 0.85),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
