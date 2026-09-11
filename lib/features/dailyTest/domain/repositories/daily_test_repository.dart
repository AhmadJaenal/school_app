import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/dailyTest/domain/entities/daily_test.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class DailyTestRepository {
  Future<Either<Failure, PaginationResult<DailyTestEntity>>> getDailyTests();
  Future<Either<Failure, DailyTestEntity>> getDailyTestDetail(int id);
  Future<Either<Failure, DailyTestEntity>> createDailyTest(dynamic params);
  Future<Either<Failure, DailyTestEntity>> updateDailyTest(
    int id,
    dynamic params,
  );
  Future<Either<Failure, bool>> deleteDailyTest(int id);
  Future<Either<Failure, bool>> bulkGrade(int id, dynamic params);
}
