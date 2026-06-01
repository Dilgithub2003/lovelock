import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Partner avatar + unlock request message.
class PendingUnlockPartnerCard extends StatelessWidget {
  const PendingUnlockPartnerCard({
    super.key,
    required this.partnerName,
  });

  final String partnerName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _PartnerAvatar(name: partnerName),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              'Your partner, $partnerName, has requested to unlock the Love Lock.',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                height: 1.45,
                color: AppColors.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PartnerAvatar extends StatelessWidget {
  const _PartnerAvatar({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 2),
              color: AppColors.surface,
            ),
            child: Center(
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBackground,
                ),
              ),
            ),
          ),
          Positioned(
            right: -2,
            bottom: -2,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite,
                size: 12,
                color: AppColors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
