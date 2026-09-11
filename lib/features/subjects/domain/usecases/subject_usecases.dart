import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/subjects/domain/entities/subject.dart';
import 'package:school_app/features/subjects/domain/repositories/subject_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class GetSubjects {
  GetSubjects(this._repository);
  final SubjectRepository _repository;
  Future<Either<Failure, PaginationResult<SubjectEntity>>> call() =>
      _repository.getSubjects();
}

class CreateSubject {
  CreateSubject(this._repository);
  final SubjectRepository _repository;
  Future<Either<Failure, SubjectEntity>> call(dynamic params) =>
      _repository.createSubject(params);
}

class GetSubjectDetail {
  GetSubjectDetail(this._repository);
  final SubjectRepository _repository;
  Future<Either<Failure, SubjectEntity>> call(int id) =>
      _repository.getSubjectDetail(id);
}

class UpdateSubject {
  UpdateSubject(this._repository);
  final SubjectRepository _repository;
  Future<Either<Failure, SubjectEntity>> call(int id) =>
      _repository.updateSubject(id);
}

class DeleteSubject {
  DeleteSubject(this._repository);
  final SubjectRepository _repository;
  Future<Either<Failure, bool>> call(int id) => _repository.deleteSubject(id);
}

class AssignTeacherToSubject {
  AssignTeacherToSubject(this._repository);
  final SubjectRepository _repository;
  Future<Either<Failure, bool>> call(int subjectId) =>
      _repository.assignTeacherToSubject(subjectId);
}
