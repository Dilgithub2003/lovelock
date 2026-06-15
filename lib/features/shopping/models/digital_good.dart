import 'package:love_lock/features/shopping/models/voucher_category.dart';

/// Digital gift voucher item.
class DigitalGood {
  const DigitalGood({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    required this.lovePoints,
    required this.description,
    required this.discountLabel,
    required this.badgeLabel,
    required this.category,
    required this.backgroundAsset,
  });

  final String id;
  final String title;
  final String subtitle;
  final String imageAsset;
  final int lovePoints;
  final String description;
  final String discountLabel;
  final String badgeLabel;
  final VoucherCategory category;
  final String backgroundAsset;
}
