import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Typography aligned with the welcome screen (geometric sans-serif / Poppins).
abstract final class AppTextStyles {
  static String get _fontFamily => GoogleFonts.poppins().fontFamily!;

  static TextStyle get brandLabel => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: const Color.fromARGB(255, 255, 150, 190),
      );

  static TextStyle get headlineLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 47,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: const Color.fromARGB(255, 255, 150, 190),
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 19,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.onBackground,
      );

  static TextStyle get labelLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.onPrimary,
      );
}
