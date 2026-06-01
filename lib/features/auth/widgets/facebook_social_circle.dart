import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_assets.dart';

/// Circular Facebook sign-in option used on auth screens.
class FacebookSocialCircle extends StatelessWidget {
  const FacebookSocialCircle({super.key});

  static const double _size = 50;
  static const Color _background = Color(0xFF1877F2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: const BoxDecoration(
        color: _background,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(2),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        AppAssets.facebookIcon,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
