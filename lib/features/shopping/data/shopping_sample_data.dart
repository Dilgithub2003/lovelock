import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/features/shopping/models/digital_good.dart';
import 'package:love_lock/features/shopping/models/gift_experience.dart';
import 'package:love_lock/features/shopping/models/gift_product.dart';
import 'package:love_lock/features/shopping/models/gift_product_filter.dart';
import 'package:love_lock/features/shopping/models/voucher_category.dart';

/// Sample catalog data for the shopping feature (UI-only).
abstract final class ShoppingSampleData {
  static const List<GiftExperience> experiences = [
    GiftExperience(
      id: 'romantic-picnic',
      title: 'Romantic Picnic',
      description:
          'Complete curated basket with local delicacies and a secret location map.',
      imageAsset: AppAssets.shoppingExperiencePicnic,
    ),
    GiftExperience(
      id: 'serenity-spa',
      title: 'Serenity Spa Retreat',
      description:
          'A full-day couples spa with massage, aromatherapy, and private suite access.',
      imageAsset: AppAssets.shoppingExperienceRooftop,
    ),
    GiftExperience(
      id: 'sunset-cruise',
      title: 'Sunset Lake Cruise',
      description:
          'Private boat tour with champagne service and a scenic sunset route.',
      imageAsset: AppAssets.shoppingExperienceBoat,
    ),
  ];

  /// Extended catalog shown on the full experience gifts screen.
  static const List<GiftExperience> catalogExperiences = [
    GiftExperience(
      id: 'romantic-picnic',
      title: 'Romantic Picnic',
      description:
          'Complete curated basket with local delicacies and a secret location map.',
      imageAsset: AppAssets.shoppingExperiencePicnic,
    ),
    GiftExperience(
      id: 'serenity-spa',
      title: 'Serenity Spa Retreat',
      description:
          'A full-day couples spa with massage, aromatherapy, and private suite access.',
      imageAsset: AppAssets.shoppingExperienceRooftop,
    ),
    GiftExperience(
      id: 'sunset-cruise',
      title: 'Sunset Lake Cruise',
      description:
          'Private boat tour with champagne service and a scenic sunset route.',
      imageAsset: AppAssets.shoppingExperienceBoat,
    ),
    GiftExperience(
      id: 'willow-garden',
      title: 'Willow Garden Escape',
      description:
          'An afternoon among weeping willows with artisan treats and live acoustic music.',
      imageAsset: AppAssets.shoppingExperiencePicnic,
    ),
    GiftExperience(
      id: 'rooftop-sunset',
      title: 'Rooftop Sunset Session',
      description:
          'City skyline views, a private photographer, and champagne at golden hour.',
      imageAsset: AppAssets.shoppingExperienceRooftop,
    ),
    GiftExperience(
      id: 'lake-adventure',
      title: 'Lake Adventure for Two',
      description:
          'Guided waterside excursion with a gourmet picnic and sunset cruise route.',
      imageAsset: AppAssets.shoppingExperienceBoat,
    ),
  ];

  static const List<GiftProduct> products = [
    GiftProduct(
      id: 'rooftop-dinner',
      title: 'Private Rooftop Dinner',
      imageAsset: AppAssets.shoppingGiftRooftopDinner,
      lovePoints: 2400,
      badgeLabel: 'RARE EXPERIENCE',
      badgeIcon: Icons.star_outline_rounded,
      type: GiftProductType.experience,
    ),
    GiftProduct(
      id: 'sanctuary-spa',
      title: 'Sanctuary Spa for Two',
      imageAsset: AppAssets.shoppingGiftSpaDay,
      lovePoints: 1850,
      badgeLabel: 'WELLNESS',
      badgeIcon: Icons.spa_outlined,
      type: GiftProductType.experience,
    ),
    GiftProduct(
      id: 'physical-gift',
      title: 'Curated Physical Gift Box',
      imageAsset: AppAssets.shoppingGiftPhysical,
      lovePoints: 1200,
      badgeLabel: 'PREMIUM',
      badgeIcon: Icons.card_giftcard_outlined,
      type: GiftProductType.physical,
    ),
  ];

  /// Extended catalog shown on the full gifts screen.
  static const List<GiftProduct> catalogProducts = [
    GiftProduct(
      id: 'rooftop-dinner',
      title: 'Private Rooftop Dinner',
      imageAsset: AppAssets.shoppingGiftRooftopDinner,
      lovePoints: 2400,
      badgeLabel: 'RARE EXPERIENCE',
      badgeIcon: Icons.star_outline_rounded,
      type: GiftProductType.experience,
    ),
    GiftProduct(
      id: 'sanctuary-spa',
      title: 'Sanctuary Spa for Two',
      imageAsset: AppAssets.shoppingGiftSpaDay,
      lovePoints: 1850,
      badgeLabel: 'WELLNESS',
      badgeIcon: Icons.spa_outlined,
      type: GiftProductType.experience,
    ),
    GiftProduct(
      id: 'candlelit-evening',
      title: 'Candlelit Evening Set',
      imageAsset: AppAssets.shoppingGiftRooftopDinner,
      lovePoints: 1600,
      badgeLabel: 'ROMANCE',
      badgeIcon: Icons.favorite_border_rounded,
      type: GiftProductType.experience,
    ),
    GiftProduct(
      id: 'wellness-retreat',
      title: 'Couples Wellness Retreat',
      imageAsset: AppAssets.shoppingGiftSpaDay,
      lovePoints: 2100,
      badgeLabel: 'WELLNESS',
      badgeIcon: Icons.self_improvement_outlined,
      type: GiftProductType.experience,
    ),
    GiftProduct(
      id: 'physical-gift',
      title: 'Curated Physical Gift Box',
      imageAsset: AppAssets.shoppingGiftPhysical,
      lovePoints: 1200,
      badgeLabel: 'PREMIUM',
      badgeIcon: Icons.card_giftcard_outlined,
      type: GiftProductType.physical,
    ),
    GiftProduct(
      id: 'signature-gift-box',
      title: 'Signature Gift Box',
      imageAsset: AppAssets.shoppingGiftPhysical,
      lovePoints: 950,
      badgeLabel: 'BEST SELLER',
      badgeIcon: Icons.local_fire_department_outlined,
      type: GiftProductType.physical,
    ),
  ];

  static const List<DigitalGood> digitalGoods = [
    DigitalGood(
      id: 'noir-velvet',
      title: 'Noir & Velvet',
      subtitle: '\$100 VALUE',
      imageAsset: AppAssets.shoppingVoucher100,
      lovePoints: 1200,
      description: 'Exclusive 5-Course Tasting Menu',
      discountLabel: '50% OFF',
      badgeLabel: 'FEATURED CHOICE',
      category: VoucherCategory.dining,
      backgroundAsset: AppAssets.shoppingGiftRooftopDinner,
    ),
    DigitalGood(
      id: 'sanctuary-escape',
      title: 'Sanctuary Escape',
      subtitle: '\$250 VALUE',
      imageAsset: AppAssets.shoppingVoucher250,
      lovePoints: 2500,
      description: 'Couples Spa & Wellness Package',
      discountLabel: '40% OFF',
      badgeLabel: 'FEATURED CHOICE',
      category: VoucherCategory.dining,
      backgroundAsset: AppAssets.shoppingGiftSpaDay,
    ),
    DigitalGood(
      id: 'skyline-journey',
      title: 'Skyline Journey',
      subtitle: '\$500 VALUE',
      imageAsset: AppAssets.shoppingVoucher500,
      lovePoints: 5000,
      description: 'Premium Travel Experience Voucher',
      discountLabel: '35% OFF',
      badgeLabel: 'TRAVEL PICK',
      category: VoucherCategory.travel,
      backgroundAsset: AppAssets.shoppingExperienceRooftop,
    ),
  ];

  /// Extended vouchers shown on the full vouchers gallery screen.
  static const List<DigitalGood> catalogVouchers = [
    DigitalGood(
      id: 'noir-velvet',
      title: 'Noir & Velvet',
      subtitle: '\$100 VALUE',
      imageAsset: AppAssets.shoppingVoucher100,
      lovePoints: 1200,
      description: 'Exclusive 5-Course Tasting Menu',
      discountLabel: '50% OFF',
      badgeLabel: 'FEATURED CHOICE',
      category: VoucherCategory.dining,
      backgroundAsset: AppAssets.shoppingGiftRooftopDinner,
    ),
    DigitalGood(
      id: 'golden-hour',
      title: 'Golden Hour',
      subtitle: '\$180 VALUE',
      imageAsset: AppAssets.shoppingVoucher250,
      lovePoints: 1800,
      description: 'Private Rooftop Dining Experience',
      discountLabel: '45% OFF',
      badgeLabel: 'FEATURED CHOICE',
      category: VoucherCategory.dining,
      backgroundAsset: AppAssets.shoppingGiftRooftopDinner,
    ),
    DigitalGood(
      id: 'skyline-journey',
      title: 'Skyline Journey',
      subtitle: '\$500 VALUE',
      imageAsset: AppAssets.shoppingVoucher500,
      lovePoints: 5000,
      description: 'Luxury Weekend Getaway for Two',
      discountLabel: '35% OFF',
      badgeLabel: 'TRAVEL PICK',
      category: VoucherCategory.travel,
      backgroundAsset: AppAssets.shoppingExperienceRooftop,
    ),
    DigitalGood(
      id: 'lake-retreat',
      title: 'Lake Retreat',
      subtitle: '\$320 VALUE',
      imageAsset: AppAssets.shoppingVoucher250,
      lovePoints: 3200,
      description: 'Sunset Cruise & Champagne Package',
      discountLabel: '30% OFF',
      badgeLabel: 'TRAVEL PICK',
      category: VoucherCategory.travel,
      backgroundAsset: AppAssets.shoppingExperienceBoat,
    ),
    DigitalGood(
      id: 'cinema-nights',
      title: 'Cinema Nights',
      subtitle: '\$75 VALUE',
      imageAsset: AppAssets.shoppingVoucher100,
      lovePoints: 750,
      description: 'Premium Couples Movie Experience',
      discountLabel: '25% OFF',
      badgeLabel: 'CINEMA SPECIAL',
      category: VoucherCategory.cinema,
      backgroundAsset: AppAssets.shoppingVoucher100,
    ),
    DigitalGood(
      id: 'premiere-pass',
      title: 'Premiere Pass',
      subtitle: '\$150 VALUE',
      imageAsset: AppAssets.shoppingVoucher500,
      lovePoints: 1500,
      description: 'VIP Screening with Reserved Seating',
      discountLabel: '20% OFF',
      badgeLabel: 'CINEMA SPECIAL',
      category: VoucherCategory.cinema,
      backgroundAsset: AppAssets.shoppingVoucher500,
    ),
  ];
}
