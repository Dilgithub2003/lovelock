import 'package:flutter/material.dart';

/// Brand palette extracted from the welcome screen design.
abstract final class AppColors {
  /// Vibrant magenta-pink — titles, brand, primary actions.
  static const Color primary = Color(0xFFF44386);

  /// Pure white — subtitles, button labels, logo heart fill.
  static const Color secondary = Color(0xFFFFFFFF);

  /// App scaffold and base canvas.
  static const Color background = Color(0xFF000000);

  /// Elevated surfaces (logo hero card).
  static const Color surface = Color(0xFF121212);

  /// Secondary action surfaces (Scan QR, show QR buttons).
  static const Color surfaceMuted = Color(0xFF2C2C2C);

  /// QR code frame background on show-my-QR screen.
  static const Color qrFrame = Color(0xFF1A2B2B);

  /// Text and icons on primary-colored controls.
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Body and subtitle text on dark backgrounds.
  static const Color onBackground = Color(0xFFFFFFFF);

  /// Headings and brand accents on dark backgrounds.
  static const Color onBackgroundAccent = primary;

  /// Subtle glow under primary buttons.
  static const Color primaryGlow = Color(0x40F44386);
}
