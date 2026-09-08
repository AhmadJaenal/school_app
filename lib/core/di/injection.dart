import 'package:get_it/get_it.dart';
import 'package:school_app/core/network/api_client.dart';
import 'package:school_app/features/attendance/domain/usecases/check_in.dart';
import 'package:school_app/features/attendance/domain/usecases/check_out.dart';
import 'package:school_app/features/attendance/domain/usecases/get_attendance.dart';

final sl = GetIt.instance;

void configureDependencies() {
  if (sl.isRegistered<DioClient>()) return;

  sl.registerLazySingleton<DioClient>(DioClient.new);

  sl.registerLazySingleton<GetAttendance>(() => GetAttendance(sl()));
  sl.registerLazySingleton<CheckIn>(() => CheckIn(sl()));
  sl.registerLazySingleton<CheckOut>(() => CheckOut(sl()));
}
