import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/screens/authentication/forgot_password.dart';
import 'package:school_app/screens/authentication/login.dart';
import 'package:school_app/screens/authentication/register.dart';
import 'package:school_app/screens/homePage/edupay/edupay.dart';
import 'package:school_app/screens/homePage/event/list_event.dart';
import 'package:school_app/screens/homePage/nav/navBar.dart';
import 'package:school_app/screens/homePage/notification/notification.dart';
import 'package:school_app/screens/homePage/parent/add_children.dart';
import 'package:school_app/screens/homePage/parent/list_children.dart';
import 'package:school_app/screens/homePage/student/absence_history.dart';
import 'package:school_app/screens/homePage/student/activity.dart';
import 'package:school_app/screens/homePage/student/camera.dart';
import 'package:school_app/screens/homePage/student/home_page.dart';
import 'package:school_app/screens/onBoarding/onBoarding.dart';

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
      home: NavBarBottom(),
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
          page: () => HomePage(),
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
          page: () => ListChildren(),
        ),
        GetPage(
          name: '/detail-data-children',
          page: () => DetailData(),
        ),
        GetPage(
          name: '/edupay',
          page: () => Edupay(),
        ),
        GetPage(
          name: '/camera',
          page: () => CameraPage(),
        ),
      ],
    );
  }
}
