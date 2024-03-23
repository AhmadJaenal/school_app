import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/screens/authentication/forgot_password.dart';
import 'package:school_app/screens/authentication/login.dart';
import 'package:school_app/screens/authentication/register.dart';
import 'package:school_app/screens/homePage/event/list_event.dart';
import 'package:school_app/screens/homePage/nav/navBar.dart';
import 'package:school_app/screens/homePage/student/absence_history.dart';
import 'package:school_app/screens/homePage/student/home_page.dart';
import 'package:school_app/screens/onBoarding/onBoarding.dart';

void main() {
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
          page: () => const AbsenceHistory(),
        ),
      ],
    );
  }
}
