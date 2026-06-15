import 'package:flutter/material.dart';

/// A single inclusion item on the gift experience detail screen.
class GiftExperienceInclusion {
  const GiftExperienceInclusion({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;
}
