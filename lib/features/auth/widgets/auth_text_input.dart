import 'package:flutter/material.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Reusable dark rounded input used in auth forms.
class AuthTextInput extends StatelessWidget {
  const AuthTextInput({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            color: AppColors.onBackground.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            color: AppColors.onBackground,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: AppColors.onBackground.withValues(alpha: 0.4),
            ),
            filled: true,
            fillColor: const Color(0xFF2B242C),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            prefixIcon: Icon(
              prefixIcon,
              size: 18,
              color: AppColors.onBackground.withValues(alpha: 0.45),
            ),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColors.primary, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
