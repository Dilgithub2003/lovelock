import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:love_lock/core/constants/app_strings.dart';
import 'package:love_lock/core/theme/app_theme.dart';
import 'package:love_lock/routes/app_router.dart';

/// Root widget: theme + [MaterialApp.router] wired to [goRouterProvider].
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
