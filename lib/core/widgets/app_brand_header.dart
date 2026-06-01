import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/constants/app_strings.dart';
import 'package:love_lock/core/theme/app_text_styles.dart';

/// Top-left brand row: small logo + uppercase app name.
class AppBrandHeader extends StatelessWidget {
  const AppBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.logo,
          width: AppSpacing.brandLogoSize,
          height: AppSpacing.brandLogoSize,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: AppSpacing.sectionXs),
        Text(
          AppStrings.appNameUppercase,
          style: AppTextStyles.brandLabel,
        ),
      ],
    );
  }
}
