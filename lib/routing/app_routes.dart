abstract class Routes {
  Routes._();

  // Onboarding & Auth
  static const String onBoarding = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Home & Navigation
  static const String homePage = '/home';
  static const String nav = '/nav';
  static const String notification = '/notification';
  static const String listEvent = '/list-event';
  static const String addAssignment = '/add-assignment';
  static const String exams = '/exams';
  static const String dailyTests = '/daily-tests';
  static const String ranking = '/ranking';

  // Student
  static const String absenceHistory = '/absence-history';
  static const String permitApplication = '/permit-application';
  static const String activityStudent = '/activity-student';
  static const String camera = '/camera';

  // Parent
  static const String addChildren = '/add-children';
  static const String listChildren = '/list-children';
  static const String detailDataChildren = '/detail-data-children/:childId';

  // Profile
  static const String profilePage = '/profile';
  static const String detailProfile = '/profile/detail';
  static const String changePassword = '/profile/change-password';
  static const String editProfile = '/profile/edit';
  static const String historyPayment = '/profile/history-payment';

  // Edupay
  static const String edupay = '/edupay';
  static const String billPage = '/edupay/bill';
  static const String paymentSpp = '/edupay/payment-spp';
  static const String invoice = '/edupay/invoice';

  // Edumart
  static const String edumart = '/edumart';
  static const String detailProduct = '/edumart/product/:productId';
  static const String cartProduct = '/edumart/cart';
  static const String historyEdumart = '/edumart/history';

  static String detailProductPath(String productId) =>
      '/edumart/product/$productId';

  static String detailDataChildrenPath(String childId) =>
      '/detail-data-children/$childId';
}
