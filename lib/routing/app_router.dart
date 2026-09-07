import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/routing/app_routes.dart';
import 'package:school_app/screens/authentication/forgot_password.dart';
import 'package:school_app/screens/authentication/login.dart';
import 'package:school_app/screens/authentication/register.dart';
import 'package:school_app/screens/homePage/edumart/cart_product.dart';
import 'package:school_app/screens/homePage/edumart/detail_product.dart';
import 'package:school_app/screens/homePage/edumart/edumart.dart';
import 'package:school_app/screens/homePage/edumart/history_edumart.dart';
import 'package:school_app/screens/homePage/edupay/bill_page.dart';
import 'package:school_app/screens/homePage/edupay/edupay.dart';
import 'package:school_app/screens/homePage/edupay/invoice_spp.dart';
import 'package:school_app/screens/homePage/edupay/payment_spp.dart';
import 'package:school_app/screens/homePage/event/list_event.dart';
import 'package:school_app/screens/homePage/nav/nav_bar.dart';
import 'package:school_app/screens/homePage/notification/notification.dart';
import 'package:school_app/screens/homePage/parent/add_children.dart';
import 'package:school_app/screens/homePage/parent/detail_data.dart';
import 'package:school_app/screens/homePage/parent/list_children.dart';
import 'package:school_app/screens/homePage/profile/change_password.dart';
import 'package:school_app/screens/homePage/profile/detail_profile.dart';
import 'package:school_app/screens/homePage/profile/edit_profile.dart';
import 'package:school_app/screens/homePage/profile/history_payment.dart';
import 'package:school_app/screens/homePage/profile/profile_page.dart';
import 'package:school_app/screens/homePage/student/absence_history.dart';
import 'package:school_app/screens/homePage/student/activity.dart';
import 'package:school_app/screens/homePage/student/home_page.dart';
import 'package:school_app/screens/homePage/student/permit_application.dart';
import 'package:school_app/screens/onBoarding/on_boarding.dart';

import 'go_router_refresh_stream.dart';

abstract class AppRouter {
  AppRouter._();

  static GoRouter build({required Stream<dynamic> authStateStream}) {
    return GoRouter(
      initialLocation: Routes.onBoarding,
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(authStateStream),
      redirect: (context, state) {
        // TODO: Implementasikan service sesungguhnya
        // final loggedIn = authService.isLoggedIn;
        final loggedIn = true;

        final loggingIn = state.matchedLocation == Routes.login ||
            state.matchedLocation == Routes.register ||
            state.matchedLocation == Routes.forgotPassword ||
            state.matchedLocation == Routes.onBoarding;

        if (!loggedIn) {
          return Routes.login;
        }
        if (loggedIn && state.matchedLocation == Routes.login) {
          return Routes.homePage;
        }
        return null;
      },
      routes: [
        // Onboarding & Auth
        GoRoute(
          path: Routes.onBoarding,
          builder: (context, state) => const OnBoarding(),
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: Routes.register,
          builder: (context, state) => Register(),
        ),
        GoRoute(
          path: Routes.forgotPassword,
          builder: (context, state) => const ForgotPassword(),
        ),

        // Home & Navigation
        GoRoute(
          path: Routes.homePage,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: Routes.nav,
          builder: (context, state) => const NavBarBottom(),
        ),
        GoRoute(
          path: Routes.notification,
          builder: (context, state) => NotificationPage(),
        ),
        GoRoute(
          path: Routes.listEvent,
          builder: (context, state) => ListEvent(),
        ),

        // Student
        GoRoute(
          path: Routes.absenceHistory,
          builder: (context, state) => AbsenceHistory(),
        ),
        GoRoute(
          path: Routes.permitApplication,
          builder: (context, state) => PermitApplication(),
        ),
        GoRoute(
          path: Routes.activityStudent,
          builder: (context, state) => ActivityStudent(),
        ),
        GoRoute(
          path: Routes.camera,
          builder: (context, state) => const CameraPage(),
        ),

        // Parent
        GoRoute(
          path: Routes.addChildren,
          builder: (context, state) => AddChildren(),
        ),
        GoRoute(
          path: Routes.listChildren,
          builder: (context, state) => const ListChildren(),
        ),
        GoRoute(
          path: Routes.detailDataChildren,
          builder: (context, state) {
            final childId = state.pathParameters['childId']!;
            // TODO: teruskan childId ke DetailData sesuai constructor aslinya
            return const DetailData();
          },
        ),

        // Profile
        GoRoute(
          path: Routes.profilePage,
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: Routes.detailProfile,
          builder: (context, state) => const DetailProfile(),
        ),
        GoRoute(
          path: Routes.changePassword,
          builder: (context, state) => const ChangePassword(),
        ),
        GoRoute(
          path: Routes.editProfile,
          builder: (context, state) => const EditProfile(),
        ),
        GoRoute(
          path: Routes.historyPayment,
          builder: (context, state) => const HistoryPayment(),
        ),

        // Edupay
        GoRoute(
          path: Routes.edupay,
          builder: (context, state) => Edupay(),
        ),
        GoRoute(
          path: Routes.billPage,
          builder: (context, state) => const BillPage(),
        ),
        GoRoute(
          path: Routes.paymentSpp,
          builder: (context, state) => const PaymentSPP(),
        ),
        GoRoute(
          path: Routes.invoice,
          builder: (context, state) => const InvoiceSPP(),
        ),

        // Edumart
        GoRoute(
          path: Routes.edumart,
          builder: (context, state) => const EdumartPage(),
        ),
        GoRoute(
          path: Routes.detailProduct,
          builder: (context, state) {
            final productId = state.pathParameters['productId']!;
            // TODO: teruskan productId ke DetailProduct sesuai constructor aslinya
            return const DetailProduct();
          },
        ),
        GoRoute(
          path: Routes.cartProduct,
          builder: (context, state) => const CartProduct(),
        ),
        GoRoute(
          path: Routes.historyEdumart,
          builder: (context, state) => const HistoryEdumart(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(child: Text('Halaman tidak ditemukan: ${state.uri}')),
      ),
    );
  }
}
