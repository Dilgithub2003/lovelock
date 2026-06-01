import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/routes/app_routes.dart';
import 'package:love_lock/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:love_lock/features/feed/data/feed_sample_data.dart';
import 'package:love_lock/features/feed/widgets/feed_post_card.dart';
import 'package:love_lock/features/feed/widgets/feed_stories_row.dart';

/// Social feed tab — "Our Moments" (UI-only).
class SocialFeedScreen extends StatelessWidget {
  const SocialFeedScreen({
    super.key,
    required this.onOpenSettings,
  });

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DashboardTopBar(onSettingsTap: onOpenSettings),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Moments',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: AppColors.onBackground,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ARCHIVING OUR SHARED JOURNEY',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 11,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onBackground.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: FeedStoriesRow()),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 88),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => FeedPostCard(
                          post: FeedSampleData.posts[index],
                        ),
                        childCount: FeedSampleData.posts.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 20,
          bottom: 16,
          child: Material(
            color: AppColors.primary,
            elevation: 6,
            shadowColor: AppColors.primaryGlow,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () => context.push(AppRoutes.createPost),
              customBorder: const CircleBorder(),
              child: const SizedBox(
                width: 56,
                height: 56,
                child: Icon(Icons.add, color: AppColors.onPrimary, size: 28),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
