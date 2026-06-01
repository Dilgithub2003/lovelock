import 'package:flutter/material.dart';
import 'package:love_lock/core/constants/app_assets.dart';

/// Circular Google sign-in option used on auth screens.
class GoogleSocialCircle extends StatelessWidget {
  const GoogleSocialCircle({super.key});

  static const double _size = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Transform.scale(
        scale: 1.15,
        child: Image.asset(
          AppAssets.googleIcon,
          width: _size,
          height: _size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
