import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/school/domain/repositories/school_repository.dart';
import 'package:school_app/features/school/data/models/school_response_model.dart';

class GetSchoolDetail {
  GetSchoolDetail(this._repository);
  final SchoolRepository _repository;
  Future<Either<Failure, SchoolResponseModel>> call(int id) =>
      _repository.getSchoolDetail(id);
}

class CreateSchool {
  CreateSchool(this._repository);
  final SchoolRepository _repository;
  Future<Either<Failure, SchoolResponseModel>> call(dynamic params) =>
      _repository.createSchool(params);
}

class UpdateSchool {
  UpdateSchool(this._repository);
  final SchoolRepository _repository;
  Future<Either<Failure, SchoolResponseModel>> call(int id, dynamic params) =>
      _repository.updateSchool(id, params);
}

class DeleteSchool {
  DeleteSchool(this._repository);
  final SchoolRepository _repository;
  Future<Either<Failure, bool>> call(int id) => _repository.deleteSchool(id);
}
