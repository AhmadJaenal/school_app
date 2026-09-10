import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

typedef SchoolJson = Map<String, dynamic>;

abstract class SchoolRemoteDataSource {
  Future<Either<Failure, PaginationResult<SchoolJson>>> getSchools();
  Future<Either<Failure, SchoolJson>> getSchool(int id);
  Future<Either<Failure, SchoolJson>> createSchool(dynamic params);
  Future<Either<Failure, SchoolJson>> updateSchool(int id, dynamic params);
  Future<Either<Failure, bool>> deleteSchool(int id);
}

class SchoolRemoteDataSourceImpl extends RepositoryHelper
    implements SchoolRemoteDataSource {
  @override
  Future<Either<Failure, PaginationResult<SchoolJson>>> getSchools() =>
      callApiWithPaginationData(
        api: dioClient.getRequest(URLs.schools),
        jsonCallback: (json) => Map<String, dynamic>.from(json as Map),
      );

  @override
  Future<Either<Failure, SchoolJson>> getSchool(int id) => callApi(
    api: dioClient.getRequest('${URLs.schools}/$id'),
    jsonCallback: (json) => Map<String, dynamic>.from(json as Map),
  );

  @override
  Future<Either<Failure, SchoolJson>> createSchool(dynamic params) => callApi(
    api: dioClient.postRequest(URLs.schools, data: params),
    jsonCallback: (json) => Map<String, dynamic>.from(json as Map),
  );

  @override
  Future<Either<Failure, SchoolJson>> updateSchool(int id, dynamic params) =>
      callApi(
        api: dioClient.putRequest('${URLs.schools}/$id', data: params),
        jsonCallback: (json) => Map<String, dynamic>.from(json as Map),
      );

  @override
  Future<Either<Failure, bool>> deleteSchool(int id) => callApiBool(
    api: dioClient.deleteRequest('${URLs.schools}/$id', data: null),
  );
}
