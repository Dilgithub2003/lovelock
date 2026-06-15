import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/features/auth/screens/auth_login_screen.dart';
import 'package:love_lock/features/dashboard/screens/dashboard_shell_screen.dart';
import 'package:love_lock/features/dashboard/models/settings_detail_args.dart';
import 'package:love_lock/features/dashboard/screens/linked_accounts_screen.dart';
import 'package:love_lock/features/dashboard/screens/notifications_screen.dart';
import 'package:love_lock/features/dashboard/screens/profile_screen.dart';
import 'package:love_lock/features/dashboard/screens/settings_detail_screen.dart';
import 'package:love_lock/features/dashboard/screens/transactions_screen.dart';
import 'package:love_lock/features/feed/screens/create_post_screen.dart';
import 'package:love_lock/features/shopping/screens/digital_goods_screen.dart';
import 'package:love_lock/features/shopping/screens/gift_experience_detail_screen.dart';
import 'package:love_lock/features/shopping/screens/gift_experiences_screen.dart';
import 'package:love_lock/features/shopping/screens/gift_product_detail_screen.dart';
import 'package:love_lock/features/shopping/screens/gift_products_screen.dart';
import 'package:love_lock/features/shopping/models/gift_product_detail.dart';
import 'package:love_lock/features/shopping/models/gift_experience_detail.dart';
import 'package:love_lock/features/shopping/models/voucher_detail.dart';
import 'package:love_lock/features/shopping/screens/voucher_detail_screen.dart';
import 'package:love_lock/features/love_locker/models/confirm_payment_args.dart';
import 'package:love_lock/features/love_locker/screens/add_funds_screen.dart';
import 'package:love_lock/features/love_locker/screens/borrow_funds_screen.dart';
import 'package:love_lock/features/love_locker/screens/settle_loan_screen.dart';
import 'package:love_lock/features/love_locker/screens/confirm_payment_screen.dart';
import 'package:love_lock/features/love_locker/screens/disburse_policy_screen.dart';
import 'package:love_lock/features/love_locker/screens/love_locker_screen.dart';
import 'package:love_lock/features/love_locker/screens/pending_unlock_screen.dart';
import 'package:love_lock/features/love_locker/screens/unlock_request_screen.dart';
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
        path: AppRoutes.transactions,
        name: AppRoutes.transactionsName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TransactionsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.settingsDetail,
        name: AppRoutes.settingsDetailName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SettingsDetailScreen.fromArgs(
            state.extra as SettingsDetailArgs?,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.linkedAccounts,
        name: AppRoutes.linkedAccountsName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LinkedAccountsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        name: AppRoutes.notificationsName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: NotificationsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profileName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ProfileScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.loveLocker,
        name: AppRoutes.loveLockerName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoveLockerScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.addFunds,
        name: AppRoutes.addFundsName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AddFundsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.confirmPayment,
        name: AppRoutes.confirmPaymentName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: ConfirmPaymentScreen.fromArgs(
            state.extra as ConfirmPaymentArgs?,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.borrowFunds,
        name: AppRoutes.borrowFundsName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: BorrowFundsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.settleLoan,
        name: AppRoutes.settleLoanName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SettleLoanScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.disbursePolicy,
        name: AppRoutes.disbursePolicyName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: DisbursePolicyScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.unlockRequest,
        name: AppRoutes.unlockRequestName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: UnlockRequestScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.pendingUnlock,
        name: AppRoutes.pendingUnlockName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: PendingUnlockScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.createPost,
        name: AppRoutes.createPostName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CreatePostScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.giftExperiences,
        name: AppRoutes.giftExperiencesName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: GiftExperiencesScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.giftProducts,
        name: AppRoutes.giftProductsName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: GiftProductsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.digitalGoods,
        name: AppRoutes.digitalGoodsName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: DigitalGoodsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.giftProductDetail,
        name: AppRoutes.giftProductDetailName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: GiftProductDetailScreen.fromArgs(
            state.extra as GiftProductDetailArgs?,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.giftExperienceDetail,
        name: AppRoutes.giftExperienceDetailName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: GiftExperienceDetailScreen.fromArgs(
            state.extra as GiftExperienceDetailArgs?,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.voucherDetail,
        name: AppRoutes.voucherDetailName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: VoucherDetailScreen.fromArgs(
            state.extra as VoucherDetailArgs?,
          ),
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri}')),
    ),
  );
});
