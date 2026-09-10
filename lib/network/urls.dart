class URLs {
  URLs._();

  static const String host = 'http://10.54.137.106:8000';
  static const String apiVersion = 'v1';

  static const String baseURL = '$host/api/$apiVersion/';
  static const String legacyBaseURL = '$host/api/';

  // Auth
  static const String login = 'auth/login';
  static const String refreshToken = 'auth/refresh-token';
  static const String logout = 'auth/logout';
  static const String register = 'auth/register';

  // Classes
  static const String classes = 'classes';
  static String detailClass(int id) => 'classes/$id';
  static String studentsInClass(int classId) => 'classes/$classId/students';
  static String moveStudentToClass({
    required int classId,
    required int studentId,
  }) => 'classes/$classId/students/$studentId/move';
  static String removeStudentFromClass({
    required int classId,
    required int studentId,
  }) => 'classes/$classId/students/$studentId';

  // Subjects
  static const String subjects = 'subjects';
  static String detailSubject(int id) => 'subjects/$id';
  static String assignTeacherToSubject(int id) => 'subjects/$id/assign-teacher';
  static String subjectTeachers(int id) => 'subjects/$id/teachers';

  // Exams
  static const String exams = 'exams';
  static String detailExam(int id) => 'exams/$id';
  static String examQuestions(int id) => 'exams/$id/questions';
  static String startExam(int id) => 'exams/$id/start';
  static String examAnswer(int id) => 'exams/$id/answer';
  static String submitExam(int id) => 'exams/$id/submit';
  static String gradeEssay({required int examId, required int participantId}) =>
      'exams/$examId/grade-essay/$participantId';
  static String examResults(int id) => 'exams/$id/results';
  static String myExamResult(int id) => 'exams/$id/my-result';

  // Parents
  static String linkStudentToParent(int parentId) =>
      'parents/$parentId/link-student';

  // Daily Tests
  static const String dailyTests = 'daily-tests';
  static String bulkDailyTestGrades(int id) => 'daily-tests/$id/grades/bulk';

  // Attendance
  static const String attendance = 'attendance';
  static const String attendanceCheckIn = 'attendance/check-in';
  static const String attendanceCheckOut = 'attendance/check-out';
  static const String attendanceGpsLog = 'attendance/gps-log';
  static String detailAttendance(int id) => 'attendance/$id';
  static String studentGpsLogs(int studentId) =>
      'attendance/gps-log/$studentId';

  // Notifications
  static const String notifications = 'notifications';
  static const String unreadNotificationCount = 'notifications/unread-count';
  static String markNotificationRead(int id) => 'notifications/$id/read';

  // Statistics
  static String studentGrades(int studentId) =>
      'statistics/students/$studentId/grades';
  static String studentAttendance(int studentId) =>
      'statistics/students/$studentId/attendance';
  static String studentReport(int studentId) =>
      'statistics/students/$studentId/rapor';
  static String classGrades(int classId) =>
      'statistics/classes/$classId/grades';
  static String classAttendance(int classId) =>
      'statistics/classes/$classId/attendance';
  static const String schoolOverview = 'statistics/school/overview';

  // Legacy
  static const String legacyRegister = 'register';
  static const String legacyLogin = 'login';
  static const String legacyCurrentUser = 'user/current';
  static const String legacyUpdateUser = 'user/update';
  static const String legacyLogout = 'user/logout';
  static const String modules = 'modules';
  static String detailModule(int id) => 'modules/$id';
  static const String classrooms = 'classroom';
  static String detailClassroom(int id) => 'classroom/$id';
  static const String studentClassrooms = 'student/classroom';
  static String detailStudentClassroom(int id) => 'student/classroom/$id';
}
