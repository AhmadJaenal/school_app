import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class DailyTestRepository {
  Future<Either<Failure, PaginationResult<DailyTestModel>>> getDailyTests();
  Future<Either<Failure, DailyTestModel>> getDailyTestDetail(int id);
  Future<Either<Failure, DailyTestModel>> createDailyTest(dynamic params);
  Future<Either<Failure, DailyTestModel>> updateDailyTest(
    int id,
    dynamic params,
  );
  Future<Either<Failure, bool>> deleteDailyTest(int id);
  Future<Either<Failure, bool>> bulkGrade(int id, dynamic params);
}
