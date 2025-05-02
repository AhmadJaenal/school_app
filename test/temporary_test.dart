import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:school_app/screens/authentication/login.dart';

void main() {
  Get.testMode = true;
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Error Login Page', (tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Login(), // Ganti dengan widget login Anda
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(Get.currentRoute, '/nav', reason: 'Navigasi tidak terjadi');
  });
}
