import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:school_app/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await HiveBoxes.initialize();

  await initializeDateFormatting('id', null);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ChangeNotifierProvider<StudentProvider>(create: (_) => StudentProvider()),
      ChangeNotifierProvider<StudentAuthProvider>(
          create: (_) => StudentAuthProvider()),
      ChangeNotifierProvider<ProjectProvider>(create: (_) => ProjectProvider()),
      ChangeNotifierProvider<TaskProvider>(create: (_) => TaskProvider()),
      ChangeNotifierProvider<PresenceProvider>(
          create: (_) => PresenceProvider()),
      ChangeNotifierProvider<SubmissionProvider>(
          create: (_) => SubmissionProvider()),
      ChangeNotifierProvider<SchoolProvider>(create: (_) => SchoolProvider()),
      ChangeNotifierProvider<AssignmentProvider>(
          create: (_) => AssignmentProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.build(authStateStream: const Stream.empty());

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
