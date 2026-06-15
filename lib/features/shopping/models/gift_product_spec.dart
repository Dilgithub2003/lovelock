import 'package:flutter/material.dart';

/// A single specification tile on the gift product detail screen.
class GiftProductSpec {
  const GiftProductSpec({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}
