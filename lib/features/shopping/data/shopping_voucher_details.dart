import 'package:flutter/material.dart';
import 'package:love_lock/features/shopping/data/shopping_sample_data.dart';
import 'package:love_lock/features/shopping/models/digital_good.dart';
import 'package:love_lock/features/shopping/models/voucher_category.dart';
import 'package:love_lock/features/shopping/models/voucher_detail.dart';

/// Detail content keyed by voucher id.
abstract final class ShoppingVoucherDetails {
  static DigitalGood? findVoucher(String id) {
    for (final item in ShoppingSampleData.catalogVouchers) {
      if (item.id == id) return item;
    }
    for (final item in ShoppingSampleData.digitalGoods) {
      if (item.id == id) return item;
    }
    return null;
  }

  static VoucherDetail? detailFor(String id) {
    final voucher = findVoucher(id);
    if (voucher == null) return null;
    return _details[id] ?? _defaultDetail(voucher);
  }

  static VoucherDetail _defaultDetail(DigitalGood voucher) {
    return VoucherDetail(
      voucher: voucher,
      heroTitle: '${voucher.title} – ${voucher.subtitle}',
      categoryTag: _categoryTag(voucher.category),
      categoryIcon: _categoryIcon(voucher.category),
      vaultStatus: 'Available to Claim',
      howToUseSteps: const [
        'Redeem the voucher using your accumulated Love Points.',
        'Find the unique digital code in your personal Vault.',
        'Present the code at any partner location to enjoy your reward.',
      ],
      validityText: 'Valid for 6 months from claim',
      terms: const [
        'Minimum spend may apply at partner locations.',
        'Valid during standard operating hours only.',
        'Cannot be combined with other offers.',
      ],
    );
  }

  static String _categoryTag(VoucherCategory category) {
    return switch (category) {
      VoucherCategory.dining => 'GOURMET SELECTION',
      VoucherCategory.travel => 'TRAVEL SELECTION',
      VoucherCategory.cinema => 'CINEMA SELECTION',
    };
  }

  static IconData _categoryIcon(VoucherCategory category) {
    return switch (category) {
      VoucherCategory.dining => Icons.restaurant_outlined,
      VoucherCategory.travel => Icons.flight_outlined,
      VoucherCategory.cinema => Icons.local_movies_outlined,
    };
  }

  static final Map<String, VoucherDetail> _details = {
    'noir-velvet': VoucherDetail(
      voucher: ShoppingSampleData.catalogVouchers[0],
      heroTitle: 'Premium Dining Experience – \$50 Voucher',
      categoryTag: 'GOURMET SELECTION',
      categoryIcon: Icons.restaurant_outlined,
      vaultStatus: 'Available to Claim',
      howToUseSteps: const [
        'Redeem the voucher using your accumulated Love Points.',
        'Find the unique digital code in your personal Vault.',
        'Present the code at any partner restaurant to enjoy your meal.',
      ],
      validityText: 'Valid for 6 months from claim',
      terms: const [
        'Minimum spend of \$100 required.',
        'Valid for dine-in only. Monday to Thursday.',
        'Cannot be combined with other offers.',
      ],
    ),
    'golden-hour': VoucherDetail(
      voucher: ShoppingSampleData.catalogVouchers[1],
      heroTitle: 'Rooftop Dining Experience – \$180 Voucher',
      categoryTag: 'GOURMET SELECTION',
      categoryIcon: Icons.restaurant_outlined,
      vaultStatus: 'Available to Claim',
      howToUseSteps: const [
        'Redeem the voucher using your accumulated Love Points.',
        'Find the unique digital code in your personal Vault.',
        'Book your rooftop session and present the code on arrival.',
      ],
      validityText: 'Valid for 6 months from claim',
      terms: const [
        'Reservation required at least 48 hours in advance.',
        'Valid Friday to Sunday evenings only.',
        'Cannot be combined with other offers.',
      ],
    ),
    'skyline-journey': VoucherDetail(
      voucher: ShoppingSampleData.catalogVouchers[2],
      heroTitle: 'Luxury Getaway Experience – \$500 Voucher',
      categoryTag: 'TRAVEL SELECTION',
      categoryIcon: Icons.flight_outlined,
      vaultStatus: 'Available to Claim',
      howToUseSteps: const [
        'Redeem the voucher using your accumulated Love Points.',
        'Find the unique digital code in your personal Vault.',
        'Contact our concierge to arrange your travel dates.',
      ],
      validityText: 'Valid for 12 months from claim',
      terms: const [
        'Subject to partner availability and blackout dates.',
        'Travel must be booked through Love Lock concierge.',
        'Cannot be exchanged for cash.',
      ],
    ),
  };
}
