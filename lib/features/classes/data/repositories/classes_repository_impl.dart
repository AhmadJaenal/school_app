import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/classes/data/datasources/classes_remote_datasource.dart';
import 'package:school_app/features/classes/domain/entities/class_entities.dart';
import 'package:school_app/features/classes/domain/entities/reponse_update_class_entity.dart';
import 'package:school_app/features/classes/domain/entities/response_create_class_entity.dart';
import 'package:school_app/features/classes/domain/entities/student_entities.dart';
import 'package:school_app/features/classes/domain/repositories/classes_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class ClassesRepositoryImpl implements ClassesRepository {
  ClassesRepositoryImpl(this._dataSource);
  final ClassesRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<ClassEntity>>> getClasses() =>
      _dataSource.getClass();

  @override
  Future<Either<Failure, ResponseCreateClassEntity>> createClass(
    dynamic params,
  ) => _dataSource.postClass(params);

  @override
  Future<Either<Failure, ClassDetailEntity>> getClassDetail(int id) =>
      _dataSource.getDetailClass(id);

  @override
  Future<Either<Failure, ResponseUpdateClassEntity>> updateClass(int id) =>
      _dataSource.updateClass(id);

  @override
  Future<Either<Failure, bool>> deleteClass(int id) =>
      _dataSource.deleteClass(id);

  @override
  Future<Either<Failure, PaginationResult<StudentEntity>>> getStudentsInClass(
    int classId,
  ) => _dataSource.getStudentsInClass(classId);

  @override
  Future<Either<Failure, void>> addStudentToClass(
    int classId,
    dynamic params,
  ) => _dataSource.addStudentToClass(classId, params);

  @override
  Future<Either<Failure, StudentEntity>> moveStudentToClass(
    int classId,
    int studentId,
  ) => _dataSource.moveStudentToClass(classId, studentId);

  @override
  Future<Either<Failure, StudentEntity>> removeStudentFromClass(
    int classId,
    int studentId,
  ) => _dataSource.deleteStudentInClass(classId, studentId);
}
