import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/teacher_entity.dart';

abstract class TeacherRepository {
  Future<Either<Failure, TeacherEntity>> getTeacherData(int id);
  Future<Either<Failure, List<TeacherEntity>>> getHistoryTransaction();
  Future<Either<Failure, List<TeacherEntity>>> getActivityStudent();
  Future<Either<Failure, List<TeacherEntity>>> getEvent();
  Future<Either<Failure, List<TeacherEntity>>> postActivity();
  Future<Either<Failure, List<TeacherEntity>>> postBusinessPermit();
}
