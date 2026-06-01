import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';

/// Camera QR scanner screen (UI-only, no camera logic yet).
class ScanQrScreen extends StatelessWidget {
  const ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
          color: AppColors.onBackgroundAccent,
        ),
        title: Text(
          'Scan QR Code',
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
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const _CameraPreviewPlaceholder(),
                  const _ScanOverlay(),
                  Positioned(
                    top: AppSpacing.sectionMd,
                    left: 0,
                    right: 0,
                    child: Text(
                      'Scan Partner QR',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontSize: 28,
                        color: AppColors.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(26, AppSpacing.sectionMd, 26, 28),
              child: Column(
                children: [
                  Text(
                    "Point your camera at your partner's Love Lock QR code to connect instantly.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                      height: 1.4,
                      color: AppColors.onBackground.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sectionLg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ScannerControlButton(
                        icon: Icons.flashlight_on_rounded,
                        label: 'Torch',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 24),
                      _ScannerControlButton(
                        icon: Icons.photo_library_outlined,
                        label: 'Gallery',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CameraPreviewPlaceholder extends StatelessWidget {
  const _CameraPreviewPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1A1A1A),
            Color(0xFF0D0D0D),
            Color(0xFF151515),
          ],
        ),
      ),
      child: CustomPaint(
        painter: _CameraGridPainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _CameraGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.onBackground.withValues(alpha: 0.04)
      ..strokeWidth = 1;

    const step = 32.0;
    for (var x = 0.0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScanOverlay extends StatelessWidget {
  const _ScanOverlay();

  static const double _frameSize = 260;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 48),
          SizedBox(
            width: _frameSize,
            height: _frameSize,
            child: Stack(
              children: const [
                _ScanCorner(top: 0, left: 0, topLeft: true),
                _ScanCorner(top: 0, right: 0, topRight: true),
                _ScanCorner(bottom: 0, left: 0, bottomLeft: true),
                _ScanCorner(bottom: 0, right: 0, bottomRight: true),
                Center(
                  child: Icon(
                    Icons.qr_code_scanner_rounded,
                    size: 48,
                    color: AppColors.onBackgroundAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanCorner extends StatelessWidget {
  const _ScanCorner({
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
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          border: Border(
            top: topLeft || topRight
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            bottom: bottomLeft || bottomRight
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            left: topLeft || bottomLeft
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            right: topRight || bottomRight
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _ScannerControlButton extends StatelessWidget {
  const _ScannerControlButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Material(
          color: AppColors.surfaceMuted,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onPressed,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: 52,
              height: 52,
              child: Icon(
                icon,
                color: AppColors.onBackground,
                size: 24,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 12,
            color: AppColors.onBackground.withValues(alpha: 0.85),
          ),
        ),
      ],
    );
  }
}
