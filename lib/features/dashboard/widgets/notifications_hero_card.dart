import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Top banner on the notifications settings screen.
class NotificationsHeroCard extends StatelessWidget {
  const NotificationsHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF3D1528),
              Color(0xFF2A1020),
              Color(0xFF1A0A14),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 16,
              top: 8,
              child: Icon(
                Icons.notifications_none_rounded,
                size: 72,
                color: AppColors.onBackground.withValues(alpha: 0.08),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'PREFERENCES',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Stay Connected',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onBackground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
