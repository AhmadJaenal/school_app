import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'screens/homePage/intern_data/assignment_project.dart';
import 'screens/homePage/project/detail_project.dart';
import 'screens/homePage/school/add_school.dart';
import 'screens/homePage/school/list_school.dart';
import 'screens/homePage/task/add_task.dart';
import 'screens/onBoarding/on_boarding.dart';
import 'screens/homePage/project/add_assignment.dart';
import 'services/project/assignment.dart';
import 'screens/homePage/student/list_user_submit_today.dart';
import 'screens/homePage/student/task_history_page.dart';
import 'screens/homePage/task/list_task.dart';
import 'services/school/school_service.dart';
import 'provider/student/index.dart';
import 'screens/homePage/task/add_submission.dart';
import 'screens/homePage/task/detail_submission.dart';
import 'screens/homePage/task/detail_task.dart';
import 'services/presence_service.dart';
import 'services/student/student_service.dart';
import 'services/submission/submission_service.dart';
import 'services/task/task_service.dart';

import 'datasource/local_datasource.dart';
import 'models/user.dart';
import 'screens/authentication/forgot_password.dart';
import 'screens/authentication/login.dart';
import 'screens/authentication/register.dart';
import 'screens/face_recognition/camera.dart';
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
import 'screens/homePage/intern_data/add_children.dart';
import 'screens/homePage/intern_data/list_children.dart';
import 'screens/homePage/profile/change_password.dart';
import 'screens/homePage/profile/detail_profile.dart';
import 'screens/homePage/profile/edit_profile.dart';
import 'screens/homePage/profile/history_payment.dart';
import 'screens/homePage/profile/profile_page.dart';
import 'screens/homePage/project/list_project.dart';
import 'screens/homePage/student/absence_history.dart';
import 'screens/homePage/student/activity.dart';
import 'screens/homePage/student/home_page.dart';
import 'screens/homePage/student/permit_application.dart';
import 'screens/homePage/task/task_project.dart';
import 'services/auth/student_auth.dart';
import 'services/project/project.dart';

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
    Future<User> getStudentData() => UserPreferences().getUser();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: getStudentData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                developer.log(
                  'Error occurred: ${snapshot.error}',
                  name: 'error.main',
                  level: 1000,
                  error: snapshot.error,
                  stackTrace: snapshot.stackTrace,
                );
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data!.token == null) {
                return const OnBoarding();
              } else {
                return const NavBarBottom();
              }
          }
        },
      ),
      getPages: [
        // Authenticate Route
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/register', page: () => Register()),
        GetPage(name: '/forgot-password', page: () => const ForgotPassword()),

        GetPage(name: '/home-page', page: () => const HomePage()),
        GetPage(name: '/nav', page: () => const NavBarBottom()),
        GetPage(name: '/list-event', page: () => ListEvent()),
        GetPage(name: '/absence-history', page: () => const AbsenceHistory()),
        GetPage(
            name: '/permit-application', page: () => const PermitApplication()),
        GetPage(name: '/notification', page: () => NotificationPage()),
        GetPage(name: '/activity-student', page: () => ActivityStudent()),
        GetPage(name: '/add-children', page: () => const AddChildren()),
        GetPage(name: '/list-student', page: () => const ListChildren()),
        GetPage(name: '/edupay', page: () => Edupay()),
        GetPage(
            name: '/camera-face-detection',
            page: () => const CameraFaceDetection()),

        // Profile Route
        GetPage(name: '/profile-page', page: () => const ProfilePage()),
        GetPage(name: '/detail-profile', page: () => const DetailProfile()),
        GetPage(name: '/change-password', page: () => const ChangePassword()),
        GetPage(name: '/edit-profile', page: () => const EditProfile()),

        // Payment Route
        GetPage(name: '/history-payment', page: () => const HistoryPayment()),
        GetPage(name: '/bill-page', page: () => const BillPage()),
        GetPage(name: '/payment-spp', page: () => const PaymentSPP()),
        GetPage(name: '/invoice', page: () => const InvoiceSPP()),

        // Edumart Route
        GetPage(name: '/edumart', page: () => const EdumartPage()),
        GetPage(name: '/detail-product', page: () => const DetailProduct()),
        GetPage(name: '/cart-product', page: () => const CartProduct()),
        GetPage(name: '/history-edumart', page: () => const HistoryEdumart()),

        // Project Route
        GetPage(name: '/list-project', page: () => const ListProject()),
        GetPage(name: '/detail-project', page: () => const DetailProject()),
        GetPage(name: '/task-project', page: () => const TaskProject()),

        // Assignment Project
        GetPage(
            name: '/assignment-project', page: () => const AssignmentProject()),
        GetPage(name: '/add-assignment', page: () => const AddAssignment()),

        // Task Route
        GetPage(name: '/list-task', page: () => const ListTask()),
        GetPage(name: '/new-task', page: () => const AddNewTask()),

        // School Route
        GetPage(name: '/list-school', page: () => const ListSchool()),
        GetPage(name: '/add-school', page: () => AddSchool()),
        GetPage(name: '/detail-task', page: () => const DetailTask()),

        // Submission Route
        GetPage(name: '/submission-task', page: () => const SubmissionTask()),
        GetPage(name: '/add-submission', page: () => const AddSubmission()),
        GetPage(name: '/task-history', page: () => const TaskHistoryPage()),
        GetPage(
            name: '/users-submit-task',
            page: () => const UsersSubmittedTasksToday()),
      ],
    );
  }
}
