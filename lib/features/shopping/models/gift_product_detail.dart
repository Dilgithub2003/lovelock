import 'package:flutter/material.dart';
import 'package:love_lock/features/shopping/models/gift_product.dart';
import 'package:love_lock/features/shopping/models/gift_product_spec.dart';

/// Full detail payload for a gift product detail screen.
class GiftProductDetail {
  const GiftProductDetail({
    required this.product,
    required this.editionLabel,
    required this.rating,
    required this.priceUsd,
    required this.craftsmanshipHeading,
    required this.craftsmanshipBody,
    required this.styleColors,
    required this.specs,
  });

  final GiftProduct product;
  final String editionLabel;
  final double rating;
  final int priceUsd;
  final String craftsmanshipHeading;
  final String craftsmanshipBody;
  final List<Color> styleColors;
  final List<GiftProductSpec> specs;
}

/// Route argument — product id to resolve from sample data.
class GiftProductDetailArgs {
  const GiftProductDetailArgs({required this.productId});

  final String productId;
}
