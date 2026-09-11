import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/classes/domain/entities/class_entities.dart';
import 'package:school_app/features/classes/domain/entities/reponse_update_class_entity.dart';
import 'package:school_app/features/classes/domain/entities/response_create_class_entity.dart';
import 'package:school_app/features/classes/domain/entities/student_entities.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class ClassesRepository {
  Future<Either<Failure, PaginationResult<ClassEntity>>> getClasses();

  Future<Either<Failure, ResponseCreateClassEntity>> createClass(
    dynamic params,
  );

  Future<Either<Failure, ClassDetailEntity>> getClassDetail(int id);

  Future<Either<Failure, ResponseUpdateClassEntity>> updateClass(int id);

  Future<Either<Failure, bool>> deleteClass(int id);

  Future<Either<Failure, PaginationResult<StudentEntity>>> getStudentsInClass(
    int classId,
  );

  Future<Either<Failure, void>> addStudentToClass(int classId, dynamic params);

  Future<Either<Failure, StudentEntity>> moveStudentToClass(
    int classId,
    int studentId,
  );

  Future<Either<Failure, StudentEntity>> removeStudentFromClass(
    int classId,
    int studentId,
  );
}
