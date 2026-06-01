import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Success screen shown after sending a partner link invitation (UI-only).
class PartnerLinkSuccessScreen extends StatefulWidget {
  const PartnerLinkSuccessScreen({super.key});

  @override
  State<PartnerLinkSuccessScreen> createState() =>
      _PartnerLinkSuccessScreenState();
}

class _PartnerLinkSuccessScreenState extends State<PartnerLinkSuccessScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.6, curve: Curves.elasticOut),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.sectionXl),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: child,
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withValues(alpha: 0.15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryGlow.withValues(alpha: 0.5),
                              blurRadius: 32,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.favorite_rounded,
                          size: 56,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          Text(
                            'Partner Link Successful!',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontSize: 32,
                              height: 1.15,
                              color: AppColors.onBackground,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sectionSm),
                          Text(
                            'Your invitation has been sent. Once your partner accepts, your shared Love Lock fund will be ready.',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                              height: 1.45,
                              color: AppColors.onBackground.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionXl),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: const _PartnerConnectionCard(),
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: _SuccessDetailTile(
                        icon: Icons.mail_outline_rounded,
                        title: 'Invitation delivered',
                        subtitle: 'Your partner will receive a link to join.',
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionSm),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: _SuccessDetailTile(
                        icon: Icons.lock_outline_rounded,
                        title: 'Love Lock pending',
                        subtitle: 'Your shared fund activates after they accept.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              label: 'Continue',
              onPressed: () => context.go(AppRoutes.dashboard),
            ),
          ],
        ),
      ),
    );
  }
}

class _PartnerConnectionCard extends StatelessWidget {
  const _PartnerConnectionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _PartnerAvatar(
            label: 'You',
            color: AppColors.primary,
            icon: Icons.person_rounded,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.link_rounded,
              color: AppColors.onBackgroundAccent,
              size: 28,
            ),
          ),
          _PartnerAvatar(
            label: 'Partner',
            color: AppColors.surface,
            icon: Icons.person_outline_rounded,
            isPending: true,
          ),
        ],
      ),
    );
  }
}

class _PartnerAvatar extends StatelessWidget {
  const _PartnerAvatar({
    required this.label,
    required this.color,
    required this.icon,
    this.isPending = false,
  });

  final String label;
  final Color color;
  final IconData icon;
  final bool isPending;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: isPending
                ? Border.all(
                    color: AppColors.onBackground.withValues(alpha: 0.3),
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  )
                : null,
          ),
          child: Icon(
            icon,
            color: AppColors.onPrimary,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 13,
            color: AppColors.onBackground.withValues(alpha: 0.85),
          ),
        ),
        if (isPending)
          Text(
            'Pending',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              color: AppColors.onBackgroundAccent,
            ),
          ),
      ],
    );
  }
}

class _SuccessDetailTile extends StatelessWidget {
  const _SuccessDetailTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onBackground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: AppColors.onBackground.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.check_circle_rounded,
            color: AppColors.primary,
            size: 22,
          ),
        ],
      ),
    );
  }
}
