import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/features/school/data/models/school_response_model.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

abstract class SchoolRemoteDataSource {
  Future<Either<Failure, PaginationResult<SchoolResponseModel>>> getSchools();
  Future<Either<Failure, SchoolResponseModel>> getSchool(int id);
  Future<Either<Failure, SchoolResponseModel>> createSchool(dynamic params);
  Future<Either<Failure, SchoolResponseModel>> updateSchool(
    int id,
    dynamic params,
  );
  Future<Either<Failure, bool>> deleteSchool(int id);
}

class SchoolRemoteDataSourceImpl extends RepositoryHelper
    implements SchoolRemoteDataSource {
  @override
  Future<Either<Failure, PaginationResult<SchoolResponseModel>>> getSchools() =>
      callApiWithPaginationData(
        api: dioClient.getRequest(URLs.schools),
        jsonCallback: (json) => SchoolResponseModel.fromJson(json),
      );

  @override
  Future<Either<Failure, SchoolResponseModel>> getSchool(int id) => callApi(
    api: dioClient.getRequest('${URLs.schools}/$id'),
    jsonCallback: (json) => SchoolResponseModel.fromJson(json),
  );

  @override
  Future<Either<Failure, SchoolResponseModel>> createSchool(dynamic params) =>
      callApi(
        api: dioClient.postRequest(URLs.schools, data: params),
        jsonCallback: (json) => SchoolResponseModel.fromJson(json),
      );

  @override
  Future<Either<Failure, SchoolResponseModel>> updateSchool(
    int id,
    dynamic params,
  ) => callApi(
    api: dioClient.putRequest('${URLs.schools}/$id', data: params),
    jsonCallback: (json) => SchoolResponseModel.fromJson(json),
  );

  @override
  Future<Either<Failure, bool>> deleteSchool(int id) => callApiBool(
    api: dioClient.deleteRequest('${URLs.schools}/$id', data: null),
  );
}
