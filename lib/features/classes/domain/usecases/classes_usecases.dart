import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/classes/domain/entities/class_entities.dart';
import 'package:school_app/features/classes/domain/entities/reponse_update_class_entity.dart';
import 'package:school_app/features/classes/domain/entities/response_create_class_entity.dart';
import 'package:school_app/features/classes/domain/entities/student_entities.dart';
import 'package:school_app/features/classes/domain/repositories/classes_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class GetClasses {
  GetClasses(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, PaginationResult<ClassEntity>>> call() =>
      _repository.getClasses();
}

class CreateClass {
  CreateClass(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, ResponseCreateClassEntity>> call(dynamic params) =>
      _repository.createClass(params);
}

class GetClassDetail {
  GetClassDetail(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, ClassDetailEntity>> call(int id) =>
      _repository.getClassDetail(id);
}

class UpdateClass {
  UpdateClass(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, ResponseUpdateClassEntity>> call(int id) =>
      _repository.updateClass(id);
}

class DeleteClass {
  DeleteClass(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, bool>> call(int id) => _repository.deleteClass(id);
}

class GetStudentsInClass {
  GetStudentsInClass(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, PaginationResult<StudentEntity>>> call(int classId) =>
      _repository.getStudentsInClass(classId);
}

class AddStudentToClass {
  AddStudentToClass(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, void>> call(int classId, dynamic params) =>
      _repository.addStudentToClass(classId, params);
}

class MoveStudentToClass {
  MoveStudentToClass(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, StudentEntity>> call(int classId, int studentId) =>
      _repository.moveStudentToClass(classId, studentId);
}

class RemoveStudentFromClass {
  RemoveStudentFromClass(this._repository);
  final ClassesRepository _repository;
  Future<Either<Failure, StudentEntity>> call(int classId, int studentId) =>
      _repository.removeStudentFromClass(classId, studentId);
}
