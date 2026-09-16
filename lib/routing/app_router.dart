import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/features/attendance/presentation/pages/absence_history_page.dart';
import 'package:school_app/features/attendance/presentation/pages/activity_page.dart';
import 'package:school_app/features/attendance/presentation/pages/camera_page.dart';
import 'package:school_app/features/attendance/presentation/pages/permit_application_page.dart';
import 'package:school_app/features/auth/presentation/pages/login_page.dart';
import 'package:school_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:school_app/features/auth/presentation/bloc/register_cubit.dart';
import 'package:school_app/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:school_app/features/auth/presentation/pages/on_boarding_page.dart';
import 'package:school_app/features/auth/presentation/pages/register_page.dart';
import 'package:school_app/features/classes/presentation/pages/ranking_page.dart';
import 'package:school_app/features/dailyTest/presentation/pages/daily_test_page.dart';
import 'package:school_app/features/edumart/presentation/pages/cart_product_page.dart';
import 'package:school_app/features/edumart/presentation/pages/detail_product_page.dart';
import 'package:school_app/features/edumart/presentation/pages/edumart_page.dart';
import 'package:school_app/features/edumart/presentation/pages/history_edumart_page.dart';
import 'package:school_app/features/edupay/presentation/pages/bill_page.dart';
import 'package:school_app/features/edupay/presentation/pages/edupay_page.dart';
import 'package:school_app/features/edupay/presentation/pages/invoice_spp_page.dart';
import 'package:school_app/features/edupay/presentation/pages/payment_spp_page.dart';
import 'package:school_app/features/exam/presentation/pages/exam_page.dart';
import 'package:school_app/features/events/presentation/pages/list_event_page.dart';
import 'package:school_app/features/home/presentation/pages/home_page.dart';
import 'package:school_app/features/home/presentation/pages/nav_bar_page.dart';
import 'package:school_app/features/notification/presentation/pages/notification_page.dart';
import 'package:school_app/features/parents/presentation/pages/add_children_page.dart';
import 'package:school_app/features/parents/presentation/pages/detail_data_page.dart';
import 'package:school_app/features/parents/presentation/pages/list_children_page.dart';
import 'package:school_app/features/profile/presentation/pages/change_password_page.dart';
import 'package:school_app/features/profile/presentation/pages/detail_profile_page.dart';
import 'package:school_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:school_app/features/profile/presentation/pages/history_payment_page.dart';
import 'package:school_app/features/profile/presentation/pages/profile_page.dart';
import 'package:school_app/features/school/presentation/pages/list_school_page.dart';
import 'package:school_app/routing/access_control.dart';
import 'package:school_app/routing/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/di/injection.dart';
import 'go_router_refresh_stream.dart';

abstract class AppRouter {
  AppRouter._();

  static GoRouter build({required Stream<dynamic> authStateStream}) => GoRouter(
    initialLocation: Routes.login,
    refreshListenable: GoRouterRefreshStream(authStateStream),
    redirect: (context, state) {
      final publicRoute = state.matchedLocation == Routes.login;
      if (!AccessControl.isAuthenticated && !publicRoute) {
        return Routes.login;
      }
      if (AccessControl.isAuthenticated && publicRoute) {
        return Routes.homePage;
      }
      final roles = _rolesFor(state.matchedLocation);
      if (roles != null && !AccessControl.canAccess(roles)) {
        return Routes.exams;
      }
      return null;
    },
    routes: [
      GoRoute(path: Routes.onBoarding, builder: (_, __) => const OnBoarding()),
      GoRoute(
        path: Routes.login,
        builder: (_, __) =>
            BlocProvider(create: (_) => sl<AuthCubit>(), child: const Login()),
      ),
      GoRoute(
        path: Routes.register,
        builder: (_, __) =>
            BlocProvider(create: (_) => sl<RegisterCubit>(), child: Register()),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (_, __) => const ForgotPassword(),
      ),
      GoRoute(path: Routes.nav, builder: (_, __) => NavBarBottom()),
      GoRoute(path: Routes.homePage, builder: (_, __) => HomePage()),
      GoRoute(
        path: Routes.profilePage,
        builder: (_, __) => const ProfilePage(),
      ),
      GoRoute(
        path: Routes.detailProfile,
        builder: (_, __) => const DetailProfile(),
      ),
      GoRoute(
        path: Routes.changePassword,
        builder: (_, __) => ChangePassword(),
      ),
      GoRoute(path: Routes.editProfile, builder: (_, __) => EditProfile()),
      GoRoute(
        path: Routes.historyPayment,
        builder: (_, __) => HistoryPayment(),
      ),
      GoRoute(path: Routes.exams, builder: (_, __) => const ExamPage()),
      GoRoute(
        path: Routes.dailyTests,
        builder: (_, __) => const DailyTestPage(),
      ),
      GoRoute(path: Routes.ranking, builder: (_, __) => const RankingPage()),
      GoRoute(
        path: Routes.absenceHistory,
        builder: (_, __) => const AbsenceHistory(),
      ),
      GoRoute(
        path: Routes.notification,
        builder: (_, __) => const NotificationPage(),
      ),
      GoRoute(
        path: Routes.activityStudent,
        builder: (_, __) => ActivityStudent(),
      ),
      GoRoute(
        path: Routes.permitApplication,
        builder: (_, __) => PermitApplication(),
      ),
      GoRoute(path: Routes.camera, builder: (_, __) => const CameraPage()),
      GoRoute(path: Routes.listEvent, builder: (_, __) => ListEvent()),
      GoRoute(path: Routes.addChildren, builder: (_, __) => AddChildren()),
      GoRoute(
        path: Routes.listChildren,
        builder: (_, __) => const ListChildren(),
      ),
      GoRoute(
        path: Routes.detailDataChildren,
        builder: (_, __) => DetailData(),
      ),
      GoRoute(path: Routes.edupay, builder: (_, __) => Edupay()),
      GoRoute(path: Routes.billPage, builder: (_, __) => const BillPage()),
      GoRoute(path: Routes.paymentSpp, builder: (_, __) => const PaymentSPP()),
      GoRoute(path: Routes.invoice, builder: (_, __) => const InvoiceSPP()),
      GoRoute(path: Routes.edumart, builder: (_, __) => const EdumartPage()),
      GoRoute(
        path: Routes.detailProduct,
        builder: (_, __) => const DetailProduct(),
      ),
      GoRoute(
        path: Routes.cartProduct,
        builder: (_, __) => const CartProduct(),
      ),
      GoRoute(
        path: Routes.historyEdumart,
        builder: (_, __) => const HistoryEdumart(),
      ),
      GoRoute(path: '/schools', builder: (_, __) => const ListSchool()),
    ],
    errorBuilder: (_, state) => Scaffold(
      body: Center(child: Text('Halaman tidak ditemukan: ${state.uri}')),
    ),
  );

  static Set<String>? _rolesFor(String location) {
    if (location == Routes.dailyTests || location == Routes.ranking) {
      return {'guru', 'admin', 'superadmin'};
    }
    return null;
  }
}
