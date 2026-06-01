import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_spacing.dart';

/// Full-width pill CTA using [ThemeData.elevatedButtonTheme].
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.buttonPadding,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
