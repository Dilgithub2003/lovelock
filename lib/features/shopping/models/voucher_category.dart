/// Voucher category filters on the vouchers gallery screen.
enum VoucherCategory {
  dining,
  travel,
  cinema,
}

extension VoucherCategoryLabel on VoucherCategory {
  String get label {
    switch (this) {
      case VoucherCategory.dining:
        return 'Dining';
      case VoucherCategory.travel:
        return 'Travel';
      case VoucherCategory.cinema:
        return 'Cinema';
    }
  }
}
