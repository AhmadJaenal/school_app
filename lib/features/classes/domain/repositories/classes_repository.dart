import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/classes/data/models/class_detail_model.dart';
import 'package:school_app/features/classes/data/models/class_model.dart';
import 'package:school_app/features/classes/data/models/response_create_class.dart';
import 'package:school_app/features/classes/data/models/student_model.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class ClassesRepository {
  Future<Either<Failure, PaginationResult<ClassModel>>> getClasses();
  Future<Either<Failure, ResponseCreateClass>> createClass(dynamic params);
  Future<Either<Failure, DetailClassModel>> getClassDetail(int id);
  Future<Either<Failure, ResponseCreateClass>> updateClass(int id);
  Future<Either<Failure, bool>> deleteClass(int id);
  Future<Either<Failure, PaginationResult<StudentModel>>> getStudentsInClass(
    int classId,
  );
  Future<Either<Failure, void>> addStudentToClass(int classId, dynamic params);
  Future<Either<Failure, StudentModel>> moveStudentToClass(
    int classId,
    int studentId,
  );
  Future<Either<Failure, StudentModel>> removeStudentFromClass(
    int classId,
    int studentId,
  );
}
