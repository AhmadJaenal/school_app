import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/activity.dart';
import '../entities/event.dart';
import '../entities/student.dart';
import '../entities/transaction.dart';

abstract class StudentRepository {
  Future<Either<Failure, StudentEntity>> getStudentData(int id);
  Future<Either<Failure, List<TransactionEntity>>> getHistoryTransaction();
  Future<Either<Failure, List<ActivityStudentEntity>>> getActivityStudent();
  Future<Either<Failure, List<EventEntity>>> getEvent();
}
