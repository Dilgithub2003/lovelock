/// Social feed post UI model.
class FeedPost {
  const FeedPost({
    required this.authorName,
    required this.timeAgo,
    required this.title,
    required this.body,
    required this.imageAsset,
    required this.avatarAsset,
    required this.likeCount,
  });

  final String authorName;
  final String timeAgo;
  final String title;
  final String body;
  final String imageAsset;
  final String avatarAsset;
  final int likeCount;
}
