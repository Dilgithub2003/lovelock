import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_assets.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/dashboard/widgets/profile_form_field.dart';

enum _RelationshipStatus { single, inRelationship }

/// Personal profile / information screen (UI-only).
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController(text: 'Eleanor St. James');
  final _emailController = TextEditingController(text: 'eleanor.sj@sanctuary.com');
  final _aboutController = TextEditingController(
    text:
        'Saving for our first home in the French Riviera. '
        'Lover of vintage photography and slow mornings.',
  );

  _RelationshipStatus _relationship = _RelationshipStatus.inRelationship;
  bool _privateProfile = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _aboutController.dispose();
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
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 8, 4),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.onBackgroundAccent,
                  ),
                  Text(
                    'Profile',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.onBackgroundAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _ProfilePhotoSection(),
                    const SizedBox(height: AppSpacing.sectionLg),
                    _RelationshipSegment(
                      selected: _relationship,
                      onChanged: (status) =>
                          setState(() => _relationship = status),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    ProfileFormField(
                      label: 'FULL NAME',
                      controller: _nameController,
                      suffixIcon: Icons.person_outline_rounded,
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    ProfileFormField(
                      label: 'EMAIL ADDRESS',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.alternate_email_rounded,
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    ProfileFormField(
                      label: 'ABOUT ME',
                      controller: _aboutController,
                      maxLines: 4,
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    _PrivateProfileTile(
                      value: _privateProfile,
                      onChanged: (v) => setState(() => _privateProfile = v),
                    ),
                    const SizedBox(height: AppSpacing.sectionSm),
                    Text(
                      'Last updated today at 11:42 AM',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: AppColors.onBackground.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              label: 'Save Changes',
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfilePhotoSection extends StatelessWidget {
  const _ProfilePhotoSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 2.5),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryGlow,
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(AppAssets.logo, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Material(
                color: AppColors.primary,
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () {},
                  customBorder: const CircleBorder(),
                  child: const SizedBox(
                    width: 36,
                    height: 36,
                    child: Icon(
                      Icons.photo_camera_rounded,
                      color: AppColors.onPrimary,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sectionSm),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'CHANGE PHOTO',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _RelationshipSegment extends StatelessWidget {
  const _RelationshipSegment({
    required this.selected,
    required this.onChanged,
  });

  final _RelationshipStatus selected;
  final ValueChanged<_RelationshipStatus> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RELATIONSHIP STATUS',
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 11,
            letterSpacing: 0.8,
            fontWeight: FontWeight.w600,
            color: AppColors.onBackground.withValues(alpha: 0.55),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surfaceMuted,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            children: [
              Expanded(
                child: _SegmentOption(
                  label: 'Single',
                  isSelected: selected == _RelationshipStatus.single,
                  onTap: () => onChanged(_RelationshipStatus.single),
                ),
              ),
              Expanded(
                child: _SegmentOption(
                  label: 'In a Relationship',
                  isSelected: selected == _RelationshipStatus.inRelationship,
                  onTap: () => onChanged(_RelationshipStatus.inRelationship),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SegmentOption extends StatelessWidget {
  const _SegmentOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppColors.onPrimary
                      : AppColors.onBackground.withValues(alpha: 0.5),
                ),
          ),
        ),
      ),
    );
  }
}

class _PrivateProfileTile extends StatelessWidget {
  const _PrivateProfileTile({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Private Profile',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onBackground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Only your partner can see your bio',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: AppColors.onBackground.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary,
            activeThumbColor: AppColors.onPrimary,
            inactiveTrackColor: AppColors.surface,
            inactiveThumbColor: AppColors.onBackground.withValues(alpha: 0.5),
          ),
        ],
      ),
    );
  }
}
