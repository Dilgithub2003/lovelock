import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/models/gift_experience.dart';
import 'package:love_lock/features/shopping/models/gift_experience_detail.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Large horizontal card for a gift experience.
class GiftExperienceCard extends StatelessWidget {
  const GiftExperienceCard({
    super.key,
    required this.experience,
    this.width = 220,
    this.onTap,
  });

  final GiftExperience experience;
  final double width;
  final VoidCallback? onTap;

  void _handleTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }
    context.push(
      AppRoutes.giftExperienceDetail,
      extra: GiftExperienceDetailArgs(experienceId: experience.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleTap(context),
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Image.asset(
                    experience.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                experience.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onBackground,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                experience.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  height: 1.4,
                  color: AppColors.onBackground.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
