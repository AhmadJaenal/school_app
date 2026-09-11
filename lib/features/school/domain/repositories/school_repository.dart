import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/school/domain/entities/school.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class SchoolRepository {
  Future<Either<Failure, PaginationResult<SchoolEntity>>> getSchools();
  Future<Either<Failure, SchoolEntity>> getSchoolDetail(int id);
  Future<Either<Failure, SchoolEntity>> createSchool(dynamic params);
  Future<Either<Failure, SchoolEntity>> updateSchool(int id, dynamic params);
  Future<Either<Failure, bool>> deleteSchool(int id);
}
