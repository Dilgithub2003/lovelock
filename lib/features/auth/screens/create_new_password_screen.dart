import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/auth/widgets/auth_text_input.dart';

/// Create-new-password page matching provided UI mock (UI-only).
class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: 35,
                          height: 1.0,
                          color: AppColors.onBackground,
                        ),
                        children: const [
                          TextSpan(text: 'Create New '),
                          TextSpan(
                            text: 'Password',
                            style: TextStyle(color: AppColors.onBackgroundAccent),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Set a strong password for your sanctuary.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        color: AppColors.onBackground.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: 28),
                    AuthTextInput(
                      label: 'NEW PASSWORD',
                      hintText: '••••••••',
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.visibility_outlined,
                          size: 18,
                          color: AppColors.onBackground.withValues(alpha: 0.45),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    AuthTextInput(
                      label: 'CONFIRM PASSWORD',
                      hintText: '••••••••',
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.visibility_off_outlined,
                          size: 18,
                          color: AppColors.onBackground.withValues(alpha: 0.45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Reset Password ->',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
