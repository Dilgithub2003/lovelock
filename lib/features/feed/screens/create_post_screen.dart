import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/constants/app_spacing.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/core/widgets/primary_button.dart';
import 'package:love_lock/features/dashboard/models/settings_detail_args.dart';
import 'package:love_lock/features/feed/widgets/create_post_action_button.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Create a new social feed post (UI-only).
class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _contentController.dispose();
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
                    'Create Post',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NEW MOMENT',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Lock a Memory',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onBackground,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionLg),
                    Stack(
                      children: [
                        Container(
                          constraints: const BoxConstraints(minHeight: 160),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceMuted,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: _contentController,
                            maxLines: 6,
                            minLines: 5,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 15,
                              color: AppColors.onBackground,
                            ),
                            decoration: InputDecoration(
                              hintText: "What's on your mind?",
                              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                                color: AppColors.onBackground.withValues(
                                  alpha: 0.4,
                                ),
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              filled: false,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: IgnorePointer(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.lock_outline_rounded,
                                size: 120,
                                color: AppColors.onBackground.withValues(
                                  alpha: 0.06,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    Row(
                      children: [
                        CreatePostActionButton(
                          icon: Icons.add_a_photo_outlined,
                          label: 'Add Photo',
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        CreatePostActionButton(
                          icon: Icons.auto_awesome_rounded,
                          label: 'Tag a Milestone',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sectionMd),
                    Material(
                      color: AppColors.surfaceMuted,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () => context.push(
                          AppRoutes.settingsDetail,
                          extra: const SettingsDetailArgs(
                            title: 'Set Privacy',
                            message:
                                'Choose who can see this moment. Default: '
                                'only you and your partner.',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: const BoxDecoration(
                                  color: AppColors.surface,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.lock_outline_rounded,
                                  color: AppColors.primary,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Set Privacy',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.onBackground,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Only you and your partner',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                        fontSize: 13,
                                        color: AppColors.onBackground
                                            .withValues(alpha: 0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.onBackground.withValues(
                                  alpha: 0.45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              label: 'Post to Sanctuary',
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
