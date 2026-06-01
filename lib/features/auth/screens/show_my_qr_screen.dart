import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Screen to display the user's QR code for partner linking (UI-only).
class ShowMyQrScreen extends StatelessWidget {
  const ShowMyQrScreen({super.key});

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
                    Text(
                      'Expand the Circle',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontSize: 32,
                        height: 1.15,
                        color: AppColors.onBackground,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionSm),
                    Text(
                      "Scan your partner's QR code to create a Love Lock.",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.onBackground.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    const _QrCodeFrame(),
                    const SizedBox(height: AppSpacing.sectionMd),
                    Text(
                      "SCAN THIS QR CODE FROM YOUR PARTNER'S DEVICE",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onBackground.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
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
                            'OR',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 12,
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
                    const SizedBox(height: AppSpacing.sectionLg),
                    const _PartnerInviteField(),
                  ],
                ),
              ),
            ),
            _SendInvitationButton(
              onPressed: () => context.push(AppRoutes.partnerLinkSuccess),
            ),
          ],
        ),
      ),
    );
  }
}

class _QrCodeFrame extends StatelessWidget {
  const _QrCodeFrame();

  static const double _qrSize = 180;
  static const double _innerPadding = 12;
  static const double _framePadding = 16;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(_framePadding),
        decoration: BoxDecoration(
          color: AppColors.qrFrame,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            const _QrCornerBracket(top: 0, left: 0, topLeft: true),
            const _QrCornerBracket(top: 0, right: 0, topRight: true),
            const _QrCornerBracket(bottom: 0, left: 0, bottomLeft: true),
            const _QrCornerBracket(bottom: 0, right: 0, bottomRight: true),
            Container(
              padding: const EdgeInsets.all(_innerPadding),
              color: Colors.white,
              child: Image.asset(
                AppAssets.qrCode,
                width: _qrSize,
                height: _qrSize,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QrCornerBracket extends StatelessWidget {
  const _QrCornerBracket({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.topLeft = false,
    this.topRight = false,
    this.bottomLeft = false,
    this.bottomRight = false,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final bool topLeft;
  final bool topRight;
  final bool bottomLeft;
  final bool bottomRight;

  @override
  Widget build(BuildContext context) {
    final borderColor = AppColors.onBackground.withValues(alpha: 0.35);

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          border: Border(
            top: topLeft || topRight
                ? BorderSide(color: borderColor, width: 2)
                : BorderSide.none,
            bottom: bottomLeft || bottomRight
                ? BorderSide(color: borderColor, width: 2)
                : BorderSide.none,
            left: topLeft || bottomLeft
                ? BorderSide(color: borderColor, width: 2)
                : BorderSide.none,
            right: topRight || bottomRight
                ? BorderSide(color: borderColor, width: 2)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _PartnerInviteField extends StatelessWidget {
  const _PartnerInviteField();

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
          Icons.person_add_alt_1_outlined,
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
