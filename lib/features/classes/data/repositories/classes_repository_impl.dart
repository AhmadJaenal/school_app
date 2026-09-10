import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/classes/data/datasources/classes_remote_datasource.dart';
import 'package:school_app/features/classes/data/models/class_detail_model.dart';
import 'package:school_app/features/classes/data/models/class_model.dart';
import 'package:school_app/features/classes/data/models/response_create_class.dart';
import 'package:school_app/features/classes/data/models/student_model.dart';
import 'package:school_app/features/classes/domain/repositories/classes_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class ClassesRepositoryImpl implements ClassesRepository {
  ClassesRepositoryImpl(this._dataSource);
  final ClassesRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<ClassModel>>> getClasses() =>
      _dataSource.getClass();

  @override
  Future<Either<Failure, ResponseCreateClass>> createClass(dynamic params) =>
      _dataSource.postClass(params);

  @override
  Future<Either<Failure, DetailClassModel>> getClassDetail(int id) =>
      _dataSource.getDetailClass(id);

  @override
  Future<Either<Failure, ResponseCreateClass>> updateClass(int id) =>
      _dataSource.updateClass(id);

  @override
  Future<Either<Failure, bool>> deleteClass(int id) =>
      _dataSource.deleteClass(id);

  @override
  Future<Either<Failure, PaginationResult<StudentModel>>> getStudentsInClass(
    int classId,
  ) => _dataSource.getStudentsInClass(classId);

  @override
  Future<Either<Failure, void>> addStudentToClass(
    int classId,
    dynamic params,
  ) => _dataSource.addStudentToClass(classId, params);

  @override
  Future<Either<Failure, StudentModel>> moveStudentToClass(
    int classId,
    int studentId,
  ) => _dataSource.moveStudentToClass(classId, studentId);

  @override
  Future<Either<Failure, StudentModel>> removeStudentFromClass(
    int classId,
    int studentId,
  ) => _dataSource.deleteStudentInClass(classId, studentId);
}
