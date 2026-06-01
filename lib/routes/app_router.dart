import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/features/auth/screens/auth_login_screen.dart';
import 'package:love_lock/features/dashboard/screens/dashboard_shell_screen.dart';
import 'package:love_lock/features/love_locker/screens/love_locker_screen.dart';
import 'package:love_lock/features/auth/screens/create_new_password_screen.dart';
import 'package:love_lock/features/auth/screens/forgot_password_screen.dart';
import 'package:love_lock/features/auth/screens/invite_partner_screen.dart';
import 'package:love_lock/features/auth/screens/link_partner_screen.dart';
import 'package:love_lock/features/auth/screens/login_screen.dart';
import 'package:love_lock/features/auth/screens/partner_link_success_screen.dart';
import 'package:love_lock/features/auth/screens/scan_qr_screen.dart';
import 'package:love_lock/features/auth/screens/show_my_qr_screen.dart';
import 'package:love_lock/features/auth/screens/sign_up_screen.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Provides the app-wide [GoRouter] instance.
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.login,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUpName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignUpScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.authLogin,
        name: AppRoutes.authLoginName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AuthLoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: AppRoutes.forgotPasswordName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ForgotPasswordScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.createNewPassword,
        name: AppRoutes.createNewPasswordName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CreateNewPasswordScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.linkPartner,
        name: AppRoutes.linkPartnerName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LinkPartnerScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.showMyQr,
        name: AppRoutes.showMyQrName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ShowMyQrScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.invitePartner,
        name: AppRoutes.invitePartnerName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: InvitePartnerScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.scanQr,
        name: AppRoutes.scanQrName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ScanQrScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.partnerLinkSuccess,
        name: AppRoutes.partnerLinkSuccessName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: PartnerLinkSuccessScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        name: AppRoutes.dashboardName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: DashboardShellScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.loveLocker,
        name: AppRoutes.loveLockerName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoveLockerScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri}')),
    ),
  );
});
