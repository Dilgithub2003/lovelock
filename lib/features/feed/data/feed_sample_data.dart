import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/features/feed/models/feed_post.dart';

/// Sample posts for the social feed tab.
abstract final class FeedSampleData {
  static const List<FeedPost> posts = [
    FeedPost(
      authorName: 'Mohamad',
      timeAgo: '3 days ago',
      title: 'Our 3rd Anniversary Dinner',
      body:
          "Everything was perfect tonight. I can't believe it's already been "
          'three years.',
      imageAsset: AppAssets.socialPostImage,
      avatarAsset: AppAssets.socialAvatar,
      likeCount: 24,
    ),
    FeedPost(
      authorName: 'Sophia',
      timeAgo: '5 days ago',
      title: 'Weekend at the coast',
      body: 'Salt air, sunset walks, and counting blessings together.',
      imageAsset: AppAssets.socialStoryArt,
      avatarAsset: AppAssets.socialAvatar,
      likeCount: 18,
    ),
    FeedPost(
      authorName: 'Ethan',
      timeAgo: '1 week ago',
      title: 'Love Lock milestone',
      body: 'Another month of saving side by side. Proud of us.',
      imageAsset: AppAssets.socialPostImage,
      avatarAsset: AppAssets.logo,
      likeCount: 31,
    ),
  ];

  static const storyPreviewAssets = [
    AppAssets.socialPostImage,
    AppAssets.socialStoryArt,
  ];
}
