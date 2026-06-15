import 'package:flutter/material.dart';
import 'package:love_lock/features/shopping/data/shopping_sample_data.dart';
import 'package:love_lock/features/shopping/models/gift_product.dart';
import 'package:love_lock/features/shopping/models/gift_product_detail.dart';
import 'package:love_lock/features/shopping/models/gift_product_spec.dart';

/// Detail content keyed by gift product id.
abstract final class ShoppingProductDetails {
  static const _styleColors = [
    Color(0xFFF8BBD0),
    Color(0xFFFCE4EC),
    Color(0xFFE91E8C),
    Color(0xFF6B1B3A),
  ];

  static GiftProduct? findProduct(String id) {
    for (final item in ShoppingSampleData.catalogProducts) {
      if (item.id == id) return item;
    }
    for (final item in ShoppingSampleData.products) {
      if (item.id == id) return item;
    }
    return null;
  }

  static GiftProductDetail? detailFor(String id) {
    final product = findProduct(id);
    if (product == null) return null;
    return _details[id] ?? _defaultDetail(product);
  }

  static GiftProductDetail _defaultDetail(GiftProduct product) {
    return GiftProductDetail(
      product: product,
      editionLabel: product.badgeLabel,
      rating: 4.8,
      priceUsd: (product.lovePoints / 10).round(),
      craftsmanshipHeading: 'The Experience',
      craftsmanshipBody:
          'A thoughtfully curated gift designed to create lasting memories '
          'for you and your partner.',
      styleColors: _styleColors,
      specs: const [
        GiftProductSpec(
          icon: Icons.shopping_bag_outlined,
          label: 'DELIVERY',
          value: '2–4 days',
        ),
        GiftProductSpec(
          icon: Icons.diamond_outlined,
          label: 'QUALITY',
          value: 'Premium grade',
        ),
        GiftProductSpec(
          icon: Icons.water_drop_outlined,
          label: 'INCLUDES',
          value: 'Full package',
        ),
        GiftProductSpec(
          icon: Icons.settings_outlined,
          label: 'SUPPORT',
          value: '24/7 concierge',
        ),
      ],
    );
  }

  static final Map<String, GiftProductDetail> _details = {
    'rooftop-dinner': GiftProductDetail(
      product: ShoppingSampleData.catalogProducts[0],
      editionLabel: 'LIMITED EDITION',
      rating: 4.8,
      priceUsd: 299,
      craftsmanshipHeading: 'The Craftsmanship',
      craftsmanshipBody:
          'An intimate rooftop dining experience with a private chef, '
          'hand-selected wines, and candlelit ambiance. Every detail is '
          'curated to celebrate your connection.',
      styleColors: _styleColors,
      specs: const [
        GiftProductSpec(
          icon: Icons.shopping_bag_outlined,
          label: 'DURATION',
          value: '3 hours',
        ),
        GiftProductSpec(
          icon: Icons.diamond_outlined,
          label: 'MENU',
          value: '5-course chef',
        ),
        GiftProductSpec(
          icon: Icons.water_drop_outlined,
          label: 'SETTING',
          value: 'Private rooftop',
        ),
        GiftProductSpec(
          icon: Icons.settings_outlined,
          label: 'SERVICE',
          value: 'Dedicated host',
        ),
      ],
    ),
    'sanctuary-spa': GiftProductDetail(
      product: ShoppingSampleData.catalogProducts[1],
      editionLabel: 'WELLNESS COLLECTION',
      rating: 4.9,
      priceUsd: 249,
      craftsmanshipHeading: 'The Sanctuary',
      craftsmanshipBody:
          'A couples spa retreat with aromatherapy oils, heated stone '
          'massage, and access to a private relaxation suite designed '
          'for complete restoration.',
      styleColors: _styleColors,
      specs: const [
        GiftProductSpec(
          icon: Icons.shopping_bag_outlined,
          label: 'DURATION',
          value: 'Full day',
        ),
        GiftProductSpec(
          icon: Icons.diamond_outlined,
          label: 'TREATMENTS',
          value: '4 sessions',
        ),
        GiftProductSpec(
          icon: Icons.water_drop_outlined,
          label: 'SUITE',
          value: 'Private access',
        ),
        GiftProductSpec(
          icon: Icons.settings_outlined,
          label: 'THERAPIST',
          value: 'Certified duo',
        ),
      ],
    ),
    'physical-gift': GiftProductDetail(
      product: ShoppingSampleData.catalogProducts[4],
      editionLabel: 'LIMITED EDITION',
      rating: 4.8,
      priceUsd: 199,
      craftsmanshipHeading: 'The Craftsmanship',
      craftsmanshipBody:
          'Each gift box is assembled by hand with premium materials, '
          'satin ribbon finishing, and a personalized note card to make '
          'your gesture unforgettable.',
      styleColors: _styleColors,
      specs: const [
        GiftProductSpec(
          icon: Icons.shopping_bag_outlined,
          label: 'WEIGHT',
          value: '142g Solid',
        ),
        GiftProductSpec(
          icon: Icons.diamond_outlined,
          label: 'MATERIAL',
          value: '18k Rose Gold',
        ),
        GiftProductSpec(
          icon: Icons.water_drop_outlined,
          label: 'RESISTANCE',
          value: '50m depth',
        ),
        GiftProductSpec(
          icon: Icons.settings_outlined,
          label: 'MOVEMENT',
          value: 'Swiss Quartz',
        ),
      ],
    ),
    'signature-gift-box': GiftProductDetail(
      product: ShoppingSampleData.catalogProducts[5],
      editionLabel: 'BEST SELLER',
      rating: 4.7,
      priceUsd: 149,
      craftsmanshipHeading: 'The Craftsmanship',
      craftsmanshipBody:
          'Our signature collection pairs artisan chocolates, a preserved '
          'rose, and a keepsake box finished in soft-touch matte with '
          'gold foil detailing.',
      styleColors: _styleColors,
      specs: const [
        GiftProductSpec(
          icon: Icons.shopping_bag_outlined,
          label: 'WEIGHT',
          value: '980g total',
        ),
        GiftProductSpec(
          icon: Icons.diamond_outlined,
          label: 'MATERIAL',
          value: 'Matte & gold foil',
        ),
        GiftProductSpec(
          icon: Icons.water_drop_outlined,
          label: 'ROSE',
          value: 'Preserved bloom',
        ),
        GiftProductSpec(
          icon: Icons.settings_outlined,
          label: 'PERSONALIZE',
          value: 'Custom note',
        ),
      ],
    ),
  };
}
