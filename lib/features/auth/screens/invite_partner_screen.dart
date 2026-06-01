import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Invite partner via email screen (UI-only).
class InvitePartnerScreen extends StatelessWidget {
  const InvitePartnerScreen({super.key});

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
          'Link with Your Partner',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.onBackgroundAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(26, 8, 26, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        AppAssets.inviteHeroIllustration,
                        width: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    Text(
                      'Invite Your Partner',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontSize: 32,
                        height: 1.15,
                        color: AppColors.onBackground,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionSm),
                    Text(
                      "Let's build your Love Lock together.",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.onBackground.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    const _PartnerEmailField(),
                    const SizedBox(height: AppSpacing.sectionMd),
                    Text(
                      'Your partner will receive an invitation to join your shared Love Lock fund.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        height: 1.4,
                        color: AppColors.onBackground.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _SendInvitationButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _PartnerEmailField extends StatelessWidget {
  const _PartnerEmailField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 14,
        color: AppColors.onBackground,
      ),
      decoration: InputDecoration(
        hintText: "Partner's email or username",
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: AppColors.onBackground.withValues(alpha: 0.4),
        ),
        filled: true,
        fillColor: AppColors.surfaceMuted,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        suffixIcon: Icon(
          Icons.alternate_email_rounded,
          size: 20,
          color: AppColors.onBackground.withValues(alpha: 0.45),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
      ),
    );
  }
}

class _SendInvitationButton extends StatelessWidget {
  const _SendInvitationButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.buttonPadding,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Send Invitation'),
            SizedBox(width: 8),
            Icon(Icons.send_rounded, size: 20),
          ],
        ),
      ),
    );
  }
}
