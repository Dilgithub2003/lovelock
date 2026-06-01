import 'package:flutter/material.dart';

/// Disbursement account option on the borrow funds screen.
class BorrowDestination {
  const BorrowDestination({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}
