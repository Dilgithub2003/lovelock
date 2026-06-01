import 'package:flutter/material.dart';

/// Corner radii matching the welcome UI (soft cards, pill buttons).
abstract final class AppRadius {
  static const double card = 32;
  static const double button = 50;

  static const BorderRadius cardBorder = BorderRadius.all(Radius.circular(card));
  static const BorderRadius buttonBorder =
      BorderRadius.all(Radius.circular(button));
}
