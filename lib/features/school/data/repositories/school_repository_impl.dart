import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/school/data/datasources/school_remote_data_source.dart';
import 'package:school_app/features/school/domain/entities/school.dart';
import 'package:school_app/features/school/domain/repositories/school_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  SchoolRepositoryImpl(this._remoteDataSource);

  final SchoolRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, PaginationResult<SchoolEntity>>> getSchools() =>
      _remoteDataSource.getSchools();

  @override
  Future<Either<Failure, SchoolEntity>> getSchoolDetail(int id) =>
      _remoteDataSource.getSchool(id);

  @override
  Future<Either<Failure, SchoolEntity>> createSchool(dynamic params) =>
      _remoteDataSource.createSchool(params);

  @override
  Future<Either<Failure, SchoolEntity>> updateSchool(int id, dynamic params) =>
      _remoteDataSource.updateSchool(id, params);

  @override
  Future<Either<Failure, bool>> deleteSchool(int id) =>
      _remoteDataSource.deleteSchool(id);
}
