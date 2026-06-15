import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Hero title with gradient highlight word (e.g. "Gifts of Connection").
class ShoppingGradientTitle extends StatelessWidget {
  const ShoppingGradientTitle({
    super.key,
    required this.prefix,
    required this.highlight,
  });

  final String prefix;
  final String highlight;

  static const _gradient = LinearGradient(
    colors: [
      AppColors.primary,
      Color(0xFFCE5FD8),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle = theme.textTheme.headlineMedium?.copyWith(
      fontSize: 34,
      fontWeight: FontWeight.w700,
      height: 1.15,
      color: AppColors.onBackground,
    );

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(prefix, style: baseStyle),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => _gradient.createShader(bounds),
          child: Text(highlight, style: baseStyle),
        ),
      ],
    );
  }
}
