import 'package:get_it/get_it.dart';
import 'package:school_app/core/network/api_client.dart';
import 'package:school_app/features/attendance/data/datasources/attendance_remote_data_source.dart';
import 'package:school_app/features/attendance/data/repositories/attendance_repository_impl.dart';
import 'package:school_app/features/attendance/domain/usecases/check_in.dart';
import 'package:school_app/features/attendance/domain/usecases/check_out.dart';
import 'package:school_app/features/attendance/domain/usecases/get_attendance.dart';
import 'package:school_app/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:school_app/features/auth/domain/usecases/forgot_password.dart';
import 'package:school_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:school_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:school_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:school_app/features/auth/domain/usecases/login.dart';
import 'package:school_app/features/auth/domain/usecases/logout.dart';
import 'package:school_app/features/auth/domain/usecases/register.dart';
import 'package:school_app/features/auth/domain/usecases/reset_password.dart';
import 'package:school_app/features/classes/data/datasources/classes_remote_datasource.dart';
import 'package:school_app/features/classes/data/repositories/classes_repository_impl.dart';
import 'package:school_app/features/classes/domain/repositories/classes_repository.dart';
import 'package:school_app/features/classes/domain/usecases/classes_usecases.dart';
import 'package:school_app/features/dailyTest/data/datasources/daily_test_remote_data_source.dart';
import 'package:school_app/features/dailyTest/data/repositories/daily_test_repository_impl.dart';
import 'package:school_app/features/dailyTest/domain/repositories/daily_test_repository.dart';
import 'package:school_app/features/dailyTest/domain/usecases/daily_test_usecases.dart';
import 'package:school_app/features/exam/data/datasources/exam_remote_data_source.dart';
import 'package:school_app/features/exam/data/repositories/exam_repository_impl.dart';
import 'package:school_app/features/exam/domain/repositories/exam_repository.dart';
import 'package:school_app/features/exam/domain/usecases/exam_usecases.dart';
import 'package:school_app/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:school_app/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:school_app/features/notification/domain/usecases/get_notifications.dart';
import 'package:school_app/features/notification/domain/usecases/get_unread_count.dart';
import 'package:school_app/features/notification/domain/usecases/mark_notification_as_read.dart';
import 'package:school_app/features/parents/data/datasources/parents_remote_data_source.dart';
import 'package:school_app/features/parents/data/repositories/parents_repository_impl.dart';
import 'package:school_app/features/parents/domain/repositories/parents_repository.dart';
import 'package:school_app/features/parents/domain/usecases/link_student_to_parent.dart';
import 'package:school_app/features/school/data/datasources/school_remote_data_source.dart';
import 'package:school_app/features/school/data/repositories/school_repository_impl.dart';
import 'package:school_app/features/school/domain/repositories/school_repository.dart';
import 'package:school_app/features/school/domain/usecases/get_schools.dart';
import 'package:school_app/features/school/domain/usecases/school_usecases.dart';
import 'package:school_app/features/statistics/data/datasources/statistics_remote_data_source.dart';
import 'package:school_app/features/statistics/data/repositories/statistics_repository_impl.dart';
import 'package:school_app/features/statistics/domain/repositories/statistics_repository.dart';
import 'package:school_app/features/statistics/domain/usecases/statistics_usecases.dart';
import 'package:school_app/features/subjects/data/datasources/subject_remote_datasource.dart';
import 'package:school_app/features/subjects/data/repositories/subject_repository_impl.dart';
import 'package:school_app/features/subjects/domain/repositories/subject_repository.dart';
import 'package:school_app/features/subjects/domain/usecases/subject_usecases.dart';
import 'package:school_app/session/session_manager.dart';

final sl = GetIt.instance;

void configureDependencies() {
  if (sl.isRegistered<DioClient>()) return;

  sl.registerLazySingleton<SessionManager>(SessionManagerImpl.new);
  sl.registerLazySingleton<DioClient>(DioClient.new);
  sl.registerLazySingleton<AttendanceRemoteDataSource>(
    AttendanceRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<ClassesRemoteDataSource>(
    ClassesRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<ClassesRepository>(
    () => ClassesRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SubjectRemoteDataSource>(
    SubjectRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<SubjectRepository>(
    () => SubjectRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ExamRemoteDataSource>(ExamRemoteDataSourceImpl.new);
  sl.registerLazySingleton<ExamRepository>(() => ExamRepositoryImpl(sl()));
  sl.registerLazySingleton<DailyTestRemoteDataSource>(
    DailyTestRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<DailyTestRepository>(
    () => DailyTestRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl.new);
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    NotificationRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ParentsRemoteDataSource>(
    ParentsRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<ParentsRepository>(
    () => ParentsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<StatisticsRemoteDataSource>(
    StatisticsRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<StatisticsRepository>(
    () => StatisticsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SchoolRemoteDataSource>(
    SchoolRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<SchoolRepositoryImpl>(
    () => SchoolRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SchoolRepository>(() => sl<SchoolRepositoryImpl>());

  sl.registerLazySingleton<GetAttendance>(() => GetAttendance(sl()));
  sl.registerLazySingleton<CheckIn>(() => CheckIn(sl()));
  sl.registerLazySingleton<CheckOut>(() => CheckOut(sl()));
  sl.registerLazySingleton<Login>(() => Login(sl()));
  sl.registerLazySingleton<Logout>(() => Logout(sl()));
  sl.registerLazySingleton<Register>(() => Register(sl()));
  sl.registerLazySingleton<ForgotPassword>(() => ForgotPassword(sl()));
  sl.registerLazySingleton<ResetPassword>(() => ResetPassword(sl()));
  sl.registerLazySingleton<GetNotifications>(() => GetNotifications(sl()));
  sl.registerLazySingleton<GetUnreadNotificationCount>(
    () => GetUnreadNotificationCount(sl()),
  );
  sl.registerLazySingleton<MarkNotificationAsRead>(
    () => MarkNotificationAsRead(sl()),
  );
  sl.registerLazySingleton<GetSchools>(() => GetSchools(sl()));
  sl.registerLazySingleton<GetSchoolDetail>(() => GetSchoolDetail(sl()));
  sl.registerLazySingleton<CreateSchool>(() => CreateSchool(sl()));
  sl.registerLazySingleton<UpdateSchool>(() => UpdateSchool(sl()));
  sl.registerLazySingleton<DeleteSchool>(() => DeleteSchool(sl()));
  sl.registerLazySingleton<LinkStudentToParent>(
    () => LinkStudentToParent(sl()),
  );

  sl.registerLazySingleton<GetClasses>(() => GetClasses(sl()));
  sl.registerLazySingleton<CreateClass>(() => CreateClass(sl()));
  sl.registerLazySingleton<GetClassDetail>(() => GetClassDetail(sl()));
  sl.registerLazySingleton<UpdateClass>(() => UpdateClass(sl()));
  sl.registerLazySingleton<DeleteClass>(() => DeleteClass(sl()));
  sl.registerLazySingleton<GetStudentsInClass>(() => GetStudentsInClass(sl()));
  sl.registerLazySingleton<AddStudentToClass>(() => AddStudentToClass(sl()));
  sl.registerLazySingleton<MoveStudentToClass>(() => MoveStudentToClass(sl()));
  sl.registerLazySingleton<RemoveStudentFromClass>(
    () => RemoveStudentFromClass(sl()),
  );

  sl.registerLazySingleton<GetSubjects>(() => GetSubjects(sl()));
  sl.registerLazySingleton<CreateSubject>(() => CreateSubject(sl()));
  sl.registerLazySingleton<GetSubjectDetail>(() => GetSubjectDetail(sl()));
  sl.registerLazySingleton<UpdateSubject>(() => UpdateSubject(sl()));
  sl.registerLazySingleton<DeleteSubject>(() => DeleteSubject(sl()));
  sl.registerLazySingleton<AssignTeacherToSubject>(
    () => AssignTeacherToSubject(sl()),
  );

  sl.registerLazySingleton<GetExams>(() => GetExams(sl()));
  sl.registerLazySingleton<GetExamDetail>(() => GetExamDetail(sl()));
  sl.registerLazySingleton<GetExamQuestions>(() => GetExamQuestions(sl()));
  sl.registerLazySingleton<StartExam>(() => StartExam(sl()));
  sl.registerLazySingleton<AnswerExam>(() => AnswerExam(sl()));
  sl.registerLazySingleton<SubmitExam>(() => SubmitExam(sl()));
  sl.registerLazySingleton<GradeEssay>(() => GradeEssay(sl()));
  sl.registerLazySingleton<GetExamResults>(() => GetExamResults(sl()));
  sl.registerLazySingleton<GetMyExamResult>(() => GetMyExamResult(sl()));

  sl.registerLazySingleton<GetDailyTests>(() => GetDailyTests(sl()));
  sl.registerLazySingleton<GetDailyTestDetail>(() => GetDailyTestDetail(sl()));
  sl.registerLazySingleton<CreateDailyTest>(() => CreateDailyTest(sl()));
  sl.registerLazySingleton<UpdateDailyTest>(() => UpdateDailyTest(sl()));
  sl.registerLazySingleton<DeleteDailyTest>(() => DeleteDailyTest(sl()));
  sl.registerLazySingleton<BulkGradeDailyTest>(() => BulkGradeDailyTest(sl()));

  sl.registerLazySingleton<GetStudentGrades>(() => GetStudentGrades(sl()));
  sl.registerLazySingleton<GetStudentAttendance>(
    () => GetStudentAttendance(sl()),
  );
  sl.registerLazySingleton<GetStudentReport>(() => GetStudentReport(sl()));
  sl.registerLazySingleton<GetClassGrades>(() => GetClassGrades(sl()));
  sl.registerLazySingleton<GetClassAttendance>(() => GetClassAttendance(sl()));
  sl.registerLazySingleton<GetSchoolOverview>(() => GetSchoolOverview(sl()));
}
