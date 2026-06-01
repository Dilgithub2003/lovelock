import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/app_top_app_bar.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/auth/widgets/auth_text_input.dart';
import 'package:love_lock/features/auth/widgets/facebook_social_circle.dart';
import 'package:love_lock/features/auth/widgets/google_social_circle.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Sign-up page matching the provided design (UI-only, no auth logic yet).
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const AppTopAppBar(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        AppAssets.logo,
                        width: 52,
                        height: 82,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Start your Love\nLock journey',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontSize: 45,
                        height: 1.0,
                        color: AppColors.onBackground,
                      ),
                    ),
                    const SizedBox(height: 28),
                    AuthTextInput(
                      label: 'EMAIL ADDRESS',
                      hintText: 'heart@sharedsanctuary.com',
                      prefixIcon: Icons.email_outlined,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.mail_outline_rounded,
                          size: 18,
                          color: AppColors.onBackground.withValues(alpha: 0.45),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    AuthTextInput(
                      label: 'PASSWORD',
                      hintText: '********',
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
                  ],
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Sign Up',
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.sectionMd),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.onBackground.withValues(alpha: 0.45),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'OR CONTINUE WITH',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 11,
                              letterSpacing: 0.7,
                              color: AppColors.onBackground.withValues(alpha: 0.85),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.onBackground.withValues(alpha: 0.45),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GoogleSocialCircle(),
                        SizedBox(width: 16),
                        FacebookSocialCircle(),
                      ],
                    ),
                    const SizedBox(height: 34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            color: AppColors.onBackground.withValues(alpha: 0.85),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.push(AppRoutes.authLogin),
                          child: Text(
                            'Log In',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
