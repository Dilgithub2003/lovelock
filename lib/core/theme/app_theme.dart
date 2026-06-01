import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_radius.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/theme/app_text_styles.dart';

/// Global [ThemeData] for Love Lock (dark, pink accent).
abstract final class AppTheme {
  static ThemeData get dark {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      onSurface: AppColors.onBackground,
      error: Color(0xFFCF6679),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        labelLarge: AppTextStyles.labelLarge,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF44386),
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
          shadowColor: AppColors.primaryGlow,
          minimumSize: const Size(double.infinity, 56),
          shape: const StadiumBorder(),
          textStyle: AppTextStyles.labelLarge,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.cardBorder),
        margin: EdgeInsets.zero,
      ),
    );
  }
}
