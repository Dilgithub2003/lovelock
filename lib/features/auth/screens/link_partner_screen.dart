import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/constants/app_strings.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Partner linking screen shown after login (UI-only).
class LinkPartnerScreen extends StatelessWidget {
  const LinkPartnerScreen({super.key});

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
          AppStrings.appName,
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
                padding: const EdgeInsets.fromLTRB(26, 8, 26, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppSpacing.sectionSm),
                    Center(
                      child: Image.asset(
                        AppAssets.partnerIllustration,
                        width: 220,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    Text(
                      'Link with Your Partner',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontSize: 32,
                        height: 1.15,
                        color: AppColors.onBackground,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionSm),
                    Text(
                      'Choose how to connect and build your Love Lock together.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.onBackground.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionXl),
                    Row(
                      children: [
                        Expanded(
                          child: _PartnerActionCard(
                            backgroundColor: AppColors.primary,
                            icon: Icons.send_rounded,
                            label: 'Invite',
                            showGlow: true,
                            onTap: () => context.push(AppRoutes.invitePartner),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _PartnerActionCard(
                            backgroundColor: AppColors.surfaceMuted,
                            icon: Icons.qr_code_rounded,
                            label: 'Scan QR',
                            onTap: () => context.push(AppRoutes.scanQr),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 0, 26, 28),
              child: _ShowQrButton(
                onPressed: () => context.push(AppRoutes.showMyQr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PartnerActionCard extends StatelessWidget {
  const _PartnerActionCard({
    required this.backgroundColor,
    required this.icon,
    required this.label,
    this.showGlow = false,
    this.onTap,
  });

  final Color backgroundColor;
  final IconData icon;
  final String label;
  final bool showGlow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: showGlow
                ? [
                    BoxShadow(
                      color: AppColors.primaryGlow.withValues(alpha: 0.6),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.onPrimary, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShowQrButton extends StatelessWidget {
  const _ShowQrButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: AppColors.surfaceMuted,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.qr_code_2_rounded,
                color: AppColors.onBackgroundAccent,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'OR SHOW MY QR CODE',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 13,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
