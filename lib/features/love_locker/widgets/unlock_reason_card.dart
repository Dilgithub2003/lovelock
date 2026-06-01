import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Selectable unlock reason card with icon, copy, and radio indicator.
class UnlockReasonCard extends StatelessWidget {
  const UnlockReasonCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.showUnionBadge = false,
  });

  final String title;
  final String description;
  final Widget icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showUnionBadge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: AppColors.surfaceMuted,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: isSelected
                ? Border.all(color: AppColors.primary, width: 1.5)
                : null,
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: AppColors.primaryGlow,
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ]
                : null,
          ),
          padding: const EdgeInsets.all(18),
          child: Stack(
            children: [
              if (showUnionBadge) const Positioned(top: 0, right: 0, child: _UnionBadge()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icon,
                  const SizedBox(height: 14),
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onBackground,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      height: 1.4,
                      color: AppColors.onBackground.withValues(alpha: 0.55),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: _RadioIndicator(isSelected: isSelected),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UnionBadge extends StatelessWidget {
  const _UnionBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.onBackground.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.celebration_outlined,
            size: 12,
            color: AppColors.onBackground.withValues(alpha: 0.45),
          ),
          const SizedBox(width: 4),
          Text(
            'UNION',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 9,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBackground.withValues(alpha: 0.45),
                ),
          ),
        ],
      ),
    );
  }
}

class _RadioIndicator extends StatelessWidget {
  const _RadioIndicator({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? AppColors.primary
              : AppColors.onBackground.withValues(alpha: 0.35),
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}

/// Pink gradient circle with heart for "The Big Day".
class UnlockReasonHeartIcon extends StatelessWidget {
  const UnlockReasonHeartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, Color(0xFFFF6B9D)],
        ),
      ),
      alignment: Alignment.center,
      child: const Icon(Icons.favorite, color: AppColors.onPrimary, size: 26),
    );
  }
}

/// Bordered circle icon for settlement / parting options.
class UnlockReasonCircleIcon extends StatelessWidget {
  const UnlockReasonCircleIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surface,
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.6)),
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: AppColors.primary, size: 24),
    );
  }
}
