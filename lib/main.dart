import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/screens/authentication/login.dart';
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
          page: () => Login(),
        ),
      ],
    );
  }
}
