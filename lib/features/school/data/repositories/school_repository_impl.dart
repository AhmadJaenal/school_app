import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/school/data/datasources/school_remote_data_source.dart';
import 'package:school_app/features/school/domain/repositories/school_repository.dart';
import 'package:school_app/features/school/data/models/school_response_model.dart';
import 'package:school_app/models/school.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  SchoolRepositoryImpl(this._remoteDataSource);

  final SchoolRemoteDataSource _remoteDataSource;

  @override
  Future<List<SchoolModel>> getSchools() async {
    final result = await _remoteDataSource.getSchools();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (page) => page.data
          .map(
            (school) => SchoolModel(
              id: int.tryParse(school.id ?? ''),
              name: school.schoolName,
              durationIntern: null,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<Either<Failure, SchoolResponseModel>> getSchoolDetail(int id) =>
      _remoteDataSource.getSchool(id);

  @override
  Future<Either<Failure, SchoolResponseModel>> createSchool(dynamic params) =>
      _remoteDataSource.createSchool(params);

  @override
  Future<Either<Failure, SchoolResponseModel>> updateSchool(
    int id,
    dynamic params,
  ) => _remoteDataSource.updateSchool(id, params);

  @override
  Future<Either<Failure, bool>> deleteSchool(int id) =>
      _remoteDataSource.deleteSchool(id);
}
