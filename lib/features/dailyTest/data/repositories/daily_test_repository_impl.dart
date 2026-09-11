import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/dailyTest/data/datasources/daily_test_remote_data_source.dart';
import 'package:school_app/features/dailyTest/domain/entities/daily_test.dart';
import 'package:school_app/features/dailyTest/domain/repositories/daily_test_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class DailyTestRepositoryImpl implements DailyTestRepository {
  DailyTestRepositoryImpl(this._dataSource);
  final DailyTestRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<DailyTestEntity>>> getDailyTests() =>
      _dataSource.getDailyTests();

  @override
  Future<Either<Failure, DailyTestEntity>> getDailyTestDetail(int id) =>
      _dataSource.getDailyTest(id);

  @override
  Future<Either<Failure, DailyTestEntity>> createDailyTest(dynamic params) =>
      _dataSource.createDailyTest(params);

  @override
  Future<Either<Failure, DailyTestEntity>> updateDailyTest(
    int id,
    dynamic params,
  ) => _dataSource.updateDailyTest(id, params);

  @override
  Future<Either<Failure, bool>> deleteDailyTest(int id) =>
      _dataSource.deleteDailyTest(id);

  @override
  Future<Either<Failure, bool>> bulkGrade(int id, dynamic params) =>
      _dataSource.bulkGrade(id, params);
}
