import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/dailyTest/data/models/daily_test_model.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

abstract class DailyTestRemoteDataSource {
  Future<Either<Failure, PaginationResult<DailyTestModel>>> getDailyTests();
  Future<Either<Failure, DailyTestModel>> getDailyTest(int id);
  Future<Either<Failure, DailyTestModel>> createDailyTest(dynamic params);
  Future<Either<Failure, DailyTestModel>> updateDailyTest(
    int id,
    dynamic params,
  );
  Future<Either<Failure, bool>> deleteDailyTest(int id);
  Future<Either<Failure, bool>> bulkGrade(int id, dynamic params);
}

class DailyTestRemoteDataSourceImpl extends RepositoryHelper
    implements DailyTestRemoteDataSource {
  @override
  Future<Either<Failure, PaginationResult<DailyTestModel>>> getDailyTests() =>
      callApiWithPaginationData(
        api: dioClient.getRequest(URLs.dailyTests),
        jsonCallback: (json) => DailyTestModel.fromJson(json),
      );

  @override
  Future<Either<Failure, DailyTestModel>> getDailyTest(int id) => callApi(
    api: dioClient.getRequest('${URLs.dailyTests}/$id'),
    jsonCallback: (json) => DailyTestModel.fromJson(json),
  );

  @override
  Future<Either<Failure, DailyTestModel>> createDailyTest(dynamic params) =>
      callApi(
        api: dioClient.postRequest(URLs.dailyTests, data: params),
        jsonCallback: (json) => DailyTestModel.fromJson(json),
      );

  @override
  Future<Either<Failure, DailyTestModel>> updateDailyTest(
    int id,
    dynamic params,
  ) => callApi(
    api: dioClient.putRequest('${URLs.dailyTests}/$id', data: params),
    jsonCallback: (json) => DailyTestModel.fromJson(json),
  );

  @override
  Future<Either<Failure, bool>> deleteDailyTest(int id) => callApiBool(
    api: dioClient.deleteRequest('${URLs.dailyTests}/$id', data: null),
  );

  @override
  Future<Either<Failure, bool>> bulkGrade(int id, dynamic params) =>
      callApiBool(
        api: dioClient.postRequest(URLs.bulkDailyTestGrades(id), data: params),
      );
}
