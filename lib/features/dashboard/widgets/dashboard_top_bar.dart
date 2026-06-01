import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_strings.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Top bar with menu, brand title, and settings.
class DashboardTopBar extends StatelessWidget {
  const DashboardTopBar({
    super.key,
    required this.onSettingsTap,
  });

  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
            color: AppColors.onBackgroundAccent,
          ),
          Expanded(
            child: Text(
              AppStrings.appName,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.onBackgroundAccent,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            onPressed: onSettingsTap,
            icon: const Icon(Icons.settings_outlined),
            color: AppColors.onBackgroundAccent,
          ),
        ],
      ),
    );
  }
}
