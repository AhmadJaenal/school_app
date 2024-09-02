import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/authentication/forgot_password.dart';
import 'screens/authentication/login.dart';
import 'screens/authentication/register.dart';
import 'screens/homePage/edumart/cart_product.dart';
import 'screens/homePage/edumart/detail_product.dart';
import 'screens/homePage/edumart/edumart.dart';
import 'screens/homePage/edumart/history_edumart.dart';
import 'screens/homePage/edupay/bill_page.dart';
import 'screens/homePage/edupay/edupay.dart';
import 'screens/homePage/edupay/invoice_spp.dart';
import 'screens/homePage/edupay/payment_spp.dart';
import 'screens/homePage/event/list_event.dart';
import 'screens/homePage/nav/nav_bar.dart';
import 'screens/homePage/notification/notification.dart';
import 'screens/homePage/parent/add_children.dart';
import 'screens/homePage/parent/list_children.dart';
import 'screens/homePage/profile/change_password.dart';
import 'screens/homePage/profile/detail_profile.dart';
import 'screens/homePage/profile/edit_profile.dart';
import 'screens/homePage/profile/history_payment.dart';
import 'screens/homePage/student/absence_history.dart';
import 'screens/homePage/student/activity.dart';
import 'screens/homePage/student/camera.dart';
import 'screens/homePage/student/home_page.dart';
import 'screens/homePage/student/permit_application.dart';
import 'screens/onBoarding/on_boarding.dart';
import 'screens/homePage/profile/profile_page.dart';

import 'screens/homePage/parent/detail_data.dart';

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
        GetPage(
          name: '/add-children',
          page: () => AddChildren(),
        ),
        GetPage(
          name: '/list-children',
          page: () => const ListChildren(),
        ),
        GetPage(
          name: '/detail-data-children',
          page: () => const DetailData(),
        ),
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
