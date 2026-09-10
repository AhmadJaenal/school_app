import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/features/attendance/presentation/pages/absence_history_page.dart';
import 'package:school_app/features/auth/presentation/pages/login_page.dart';
import 'package:school_app/features/classes/presentation/pages/ranking_page.dart';
import 'package:school_app/features/dailyTest/presentation/pages/daily_test_page.dart';
import 'package:school_app/features/exam/presentation/pages/exam_page.dart';
import 'package:school_app/features/notification/presentation/pages/notification_page.dart';
import 'package:school_app/features/school/presentation/pages/list_school_page.dart';
import 'package:school_app/routing/access_control.dart';
import 'package:school_app/routing/app_routes.dart';
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
        return Routes.exams;
      }
      final roles = _rolesFor(state.matchedLocation);
      if (roles != null && !AccessControl.canAccess(roles)) {
        return Routes.exams;
      }
      return null;
    },
    routes: [
      GoRoute(path: Routes.login, builder: (_, __) => const Login()),
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
