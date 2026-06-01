import 'package:flutter/material.dart';

/// Layout spacing derived from the welcome screen design.
abstract final class AppSpacing {
  static const double screenHorizontal = 40;
  static const double screenVertical = 24;

  static const double sectionXl = 48;
  static const double sectionLg = 32;
  static const double sectionMd = 24;
  static const double sectionSm = 12;
  static const double sectionXs = 8;

  static const double logoHeroMaxWidth = 280;
  static const double logoHeroMaxHeight = 320;
  static const double logoHeroPadding = 8;
  static const double brandLogoSize = 38;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
    vertical: screenVertical,
  );

  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
    vertical: screenVertical,
  );
}
