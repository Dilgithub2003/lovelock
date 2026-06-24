import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Back arrow + left-aligned title used across feature screens.
class ScreenBackHeader extends StatelessWidget {
  const ScreenBackHeader({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleMedium?.copyWith(
      color: AppColors.onBackgroundAccent,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 8, 4),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack ?? () => context.pop(),
            icon: const Icon(Icons.arrow_back),
            color: AppColors.onBackgroundAccent,
          ),
          if (trailing == null)
            Text(title, style: titleStyle)
          else ...[
            Expanded(child: Text(title, style: titleStyle)),
            trailing!,
          ],
        ],
      ),
    );
  }
}
