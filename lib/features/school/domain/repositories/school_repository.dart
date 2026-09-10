import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/models/school.dart';
import 'package:school_app/features/school/data/models/school_response_model.dart';

abstract interface class SchoolRepository {
  Future<List<SchoolModel>> getSchools();
  Future<Either<Failure, SchoolResponseModel>> getSchoolDetail(int id);
  Future<Either<Failure, SchoolResponseModel>> createSchool(dynamic params);
  Future<Either<Failure, SchoolResponseModel>> updateSchool(
    int id,
    dynamic params,
  );
  Future<Either<Failure, bool>> deleteSchool(int id);
}
