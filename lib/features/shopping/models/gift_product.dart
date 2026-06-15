import 'package:flutter/material.dart';
import 'package:love_lock/features/shopping/models/gift_product_filter.dart';

/// Purchasable gift product priced in LovePoints.
class GiftProduct {
  const GiftProduct({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.lovePoints,
    required this.badgeLabel,
    required this.badgeIcon,
    required this.type,
  });

  final String id;
  final String title;
  final String imageAsset;
  final int lovePoints;
  final String badgeLabel;
  final IconData badgeIcon;
  final GiftProductType type;
}
