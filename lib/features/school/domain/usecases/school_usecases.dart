import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/school/domain/entities/school.dart';
import 'package:school_app/features/school/domain/repositories/school_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class GetSchools {
  GetSchools(this._repository);
  final SchoolRepository _repository;

  Future<Either<Failure, PaginationResult<SchoolEntity>>> call() =>
      _repository.getSchools();
}

class GetSchoolDetail {
  GetSchoolDetail(this._repository);
  final SchoolRepository _repository;
  Future<Either<Failure, SchoolEntity>> call(int id) =>
      _repository.getSchoolDetail(id);
}

class CreateSchool {
  CreateSchool(this._repository);
  final SchoolRepository _repository;
  Future<Either<Failure, SchoolEntity>> call(dynamic params) =>
      _repository.createSchool(params);
}

class UpdateSchool {
  UpdateSchool(this._repository);
  final SchoolRepository _repository;
  Future<Either<Failure, SchoolEntity>> call(int id, dynamic params) =>
      _repository.updateSchool(id, params);
}

class DeleteSchool {
  DeleteSchool(this._repository);
  final SchoolRepository _repository;
  Future<Either<Failure, bool>> call(int id) => _repository.deleteSchool(id);
}
