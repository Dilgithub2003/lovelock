import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/constants/app_strings.dart';
import 'package:love_lock/core/theme/app_text_styles.dart';
import 'package:love_lock/core/widgets/app_top_app_bar.dart';
import 'package:love_lock/core/widgets/logo_hero_card.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Welcome / entry screen (auth flow to be added later).
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopAppBar(),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    const LogoHeroCard(),
                    const SizedBox(height: AppSpacing.sectionXl),
                    const _WelcomeCopy(),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              label: AppStrings.getStarted,
              onPressed: () => context.push(AppRoutes.signUp),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeCopy extends StatelessWidget {
  const _WelcomeCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.appName,
          style: AppTextStyles.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sectionSm),
        Text(
          AppStrings.tagline,
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
