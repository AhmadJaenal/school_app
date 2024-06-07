import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/auth/presentation/pages/forgot_password.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/auth/presentation/pages/resigter.dart';
import 'features/eduMart/presentation/pages/cart_product.dart';
import 'features/eduMart/presentation/pages/detail_product.dart';
import 'features/eduMart/presentation/pages/edumart.dart';
import 'features/eduMart/presentation/pages/history_edumart.dart';
import 'features/eduPay/presentation/pages/bill_page.dart';
import 'features/eduPay/presentation/pages/edupay.dart';
import 'features/eduPay/presentation/pages/invoice_spp.dart';
import 'features/eduPay/presentation/pages/payment_spp.dart';
import 'features/event/presentation/pages/list_event.dart';
import 'features/notification.dart/presentation/pages/notification.dart';
import 'features/onBoarding/presentation/pages/nav_bar.dart';
import 'features/profile/presentation/pages/change_password.dart';
import 'features/profile/presentation/pages/detail_profile.dart';
import 'features/profile/presentation/pages/edit_profile.dart';
import 'features/profile/presentation/pages/history_payment.dart';
import 'features/profile/presentation/pages/profile.dart';
import 'features/student/presentation/pages/absence_history.dart';
import 'features/student/presentation/pages/activity_student.dart';
import 'features/student/presentation/pages/camera.dart';
import 'features/student/presentation/pages/home_page.dart';
import 'features/student/presentation/pages/permit_application.dart';

import 'features/onBoarding/presentation/pages/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoarding(),
      getPages: [
        GetPage(
          name: '/login',
          page: () => const Login(),
        ),
        GetPage(
          name: '/register',
          page: () => Register(),
        ),
        GetPage(
          name: '/forgot-password',
          page: () => const ForgotPassword(),
        ),
        GetPage(
          name: '/home-page',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/nav',
          page: () => const NavBarBottom(),
        ),
        GetPage(
          name: '/list-event',
          page: () => ListEvent(),
        ),
        GetPage(
          name: '/absence-history',
          page: () => AbsenceHistory(),
        ),
        GetPage(
          name: '/permit-application',
          page: () => PermitApplication(),
        ),
        GetPage(
          name: '/notification',
          page: () => NotificationPage(),
        ),
        GetPage(
          name: '/activity-student',
          page: () => ActivityStudent(),
        ),
        // GetPage(
        //   name: '/add-children',
        //   page: () => AddChildren(),
        // ),
        // GetPage(
        //   name: '/list-children',
        //   page: () => const ListChildren(),
        // ),
        // GetPage(
        //   name: '/detail-data-children',
        //   page: () => const DetailData(),
        // ),
        GetPage(
          name: '/edupay',
          page: () => Edupay(),
        ),
        GetPage(
          name: '/camera',
          page: () => const CameraPage(),
        ),
        GetPage(
          name: '/profile-page',
          page: () => const ProfilePage(),
        ),
        GetPage(
          name: '/detail-profile',
          page: () => const DetailProfile(),
        ),
        GetPage(
          name: '/change-password',
          page: () => const ChangePassword(),
        ),
        GetPage(
          name: '/edit-profile',
          page: () => const EditProfile(),
        ),
        GetPage(
          name: '/history-payment',
          page: () => const HistoryPayment(),
        ),
        GetPage(
          name: '/bill-page',
          page: () => const BillPage(),
        ),
        GetPage(
          name: '/payment-spp',
          page: () => const PaymentSPP(),
        ),
        GetPage(
          name: '/invoice',
          page: () => const InvoiceSPP(),
        ),
        GetPage(
          name: '/edumart',
          page: () => const EdumartPage(),
        ),
        GetPage(
          name: '/detail-product',
          page: () => const DetailProduct(),
        ),
        GetPage(
          name: '/cart-product',
          page: () => const CartProduct(),
        ),
        GetPage(
          name: '/history-edumart',
          page: () => const HistoryEdumart(),
        ),
      ],
    );
  }
}
