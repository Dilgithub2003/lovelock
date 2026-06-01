import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/app_brand_header.dart';

/// Reusable top app bar that displays the Love Lock brand.
class AppTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: AppSpacing.screenHorizontal,
      title: const AppBrandHeader(),
    );
  }
}
