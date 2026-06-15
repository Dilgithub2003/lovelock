import 'package:flutter/material.dart';
import 'package:love_lock/features/shopping/models/digital_good.dart';

/// Full detail payload for a voucher detail screen.
class VoucherDetail {
  const VoucherDetail({
    required this.voucher,
    required this.heroTitle,
    required this.categoryTag,
    required this.categoryIcon,
    required this.vaultStatus,
    required this.howToUseSteps,
    required this.validityText,
    required this.terms,
  });

  final DigitalGood voucher;
  final String heroTitle;
  final String categoryTag;
  final IconData categoryIcon;
  final String vaultStatus;
  final List<String> howToUseSteps;
  final String validityText;
  final List<String> terms;
}

/// Route argument — voucher id to resolve from sample data.
class VoucherDetailArgs {
  const VoucherDetailArgs({required this.voucherId});

  final String voucherId;
}
