import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Dark rounded card with optional uppercase section label.
class PendingUnlockDetailCard extends StatelessWidget {
  const PendingUnlockDetailCard({
    super.key,
    this.sectionLabel,
    required this.child,
    this.trailing,
  });

  final String? sectionLabel;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (trailing != null)
            Positioned(top: 0, right: 0, child: trailing!),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sectionLabel != null) ...[
                Text(
                  sectionLabel!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary.withValues(alpha: 0.85),
                      ),
                ),
                const SizedBox(height: 8),
              ],
              child,
            ],
          ),
        ],
      ),
    );
  }
}
