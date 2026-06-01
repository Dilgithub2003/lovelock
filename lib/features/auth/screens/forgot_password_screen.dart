import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/auth/widgets/auth_text_input.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Forgot password page matching the provided UI mock (UI-only).
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
          color: AppColors.onBackgroundAccent,
        ),
        title: Text(
          'Reset Password',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.onBackgroundAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 24),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: 43,
                          height: 1.0,
                          color: AppColors.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "No worries, we'll send you reset instructions.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.onBackground.withValues(alpha: 0.85),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const AuthTextInput(
                        label: 'EMAIL OR USERNAME',
                        hintText: 'email or username',
                        prefixIcon: Icons.person_outline_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PrimaryButton(
              label: 'Send Reset Link',
              onPressed: () => context.push(AppRoutes.createNewPassword),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextButton.icon(
                onPressed: () => context.go(AppRoutes.authLogin),
                icon: Icon(
                  Icons.arrow_back,
                  size: 14,
                  color: AppColors.onBackground.withValues(alpha: 0.85),
                ),
                label: Text(
                  'Back to sign in',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: AppColors.onBackground.withValues(alpha: 0.85),
                  ),
                ),
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  foregroundColor: AppColors.onBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
