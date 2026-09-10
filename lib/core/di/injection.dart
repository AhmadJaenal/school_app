import 'package:get_it/get_it.dart';
import 'package:school_app/core/network/api_client.dart';
import 'package:school_app/features/attendance/data/datasources/attendance_remote_data_source.dart';
import 'package:school_app/features/attendance/data/repositories/attendance_repository_impl.dart';
import 'package:school_app/features/attendance/domain/usecases/check_in.dart';
import 'package:school_app/features/attendance/domain/usecases/check_out.dart';
import 'package:school_app/features/attendance/domain/usecases/get_attendance.dart';
import 'package:school_app/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:school_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:school_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:school_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:school_app/features/auth/domain/usecases/login.dart';
import 'package:school_app/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:school_app/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:school_app/features/notification/domain/usecases/get_notifications.dart';
import 'package:school_app/features/school/data/datasources/school_remote_data_source.dart';
import 'package:school_app/features/school/data/repositories/school_repository_impl.dart';
import 'package:school_app/features/school/domain/usecases/get_schools.dart';
import 'package:school_app/session/session_manager.dart';

final sl = GetIt.instance;

void configureDependencies() {
  if (sl.isRegistered<DioClient>()) return;

  sl.registerLazySingleton<SessionManager>(SessionManagerImpl.new);
  sl.registerLazySingleton<DioClient>(DioClient.new);
  sl.registerLazySingleton<AttendanceRemoteDataSource>(
    AttendanceRemoteDataSourceImpl.new,
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
  sl.registerLazySingleton<SchoolRemoteDataSource>(
    SchoolRemoteDataSourceImpl.new,
  );
  sl.registerLazySingleton<SchoolRepositoryImpl>(
    () => SchoolRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetAttendance>(() => GetAttendance(sl()));
  sl.registerLazySingleton<CheckIn>(() => CheckIn(sl()));
  sl.registerLazySingleton<CheckOut>(() => CheckOut(sl()));
  sl.registerLazySingleton<Login>(() => Login(sl()));
  sl.registerLazySingleton<GetNotifications>(() => GetNotifications(sl()));
  sl.registerLazySingleton<GetSchools>(() => GetSchools(sl()));
}
