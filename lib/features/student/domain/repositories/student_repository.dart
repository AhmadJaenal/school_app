import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../event/domain/entities/event_entity.dart';
import '../../../transaction/domain/entities/transaction_entity.dart';
import '../entities/activity.dart';
import '../entities/student.dart';

abstract class StudentRepository {
  Future<Either<Failure, StudentEntity>> getStudentData(int id);
  Future<Either<Failure, List<TransactionEntity>>> getHistoryTransaction();
  Future<Either<Failure, List<ActivityStudentEntity>>> getActivityStudent();
  Future<Either<Failure, List<EventEntity>>> getEvent();
}
