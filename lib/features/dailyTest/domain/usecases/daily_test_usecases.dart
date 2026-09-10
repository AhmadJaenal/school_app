import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/dailyTest/domain/repositories/daily_test_repository.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';
import 'package:school_app/models/pagination_model.dart';

class GetDailyTests {
  GetDailyTests(this._repository);
  final DailyTestRepository _repository;
  Future<Either<Failure, PaginationResult<DailyTestModel>>> call() =>
      _repository.getDailyTests();
}

class GetDailyTestDetail {
  GetDailyTestDetail(this._repository);
  final DailyTestRepository _repository;
  Future<Either<Failure, DailyTestModel>> call(int id) =>
      _repository.getDailyTestDetail(id);
}

class CreateDailyTest {
  CreateDailyTest(this._repository);
  final DailyTestRepository _repository;
  Future<Either<Failure, DailyTestModel>> call(dynamic params) =>
      _repository.createDailyTest(params);
}

class UpdateDailyTest {
  UpdateDailyTest(this._repository);
  final DailyTestRepository _repository;
  Future<Either<Failure, DailyTestModel>> call(int id, dynamic params) =>
      _repository.updateDailyTest(id, params);
}

class DeleteDailyTest {
  DeleteDailyTest(this._repository);
  final DailyTestRepository _repository;
  Future<Either<Failure, bool>> call(int id) => _repository.deleteDailyTest(id);
}

class BulkGradeDailyTest {
  BulkGradeDailyTest(this._repository);
  final DailyTestRepository _repository;
  Future<Either<Failure, bool>> call(int id, dynamic params) =>
      _repository.bulkGrade(id, params);
}
