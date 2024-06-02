import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/transaction.dart';
import '../repositories/student_repository.dart';

class GetHistoryTransaction {
  final StudentRepository studentRepository;

  const GetHistoryTransaction(this.studentRepository);

  Future<Either<Failure, List<TransactionEntity>>> execute() async {
    return await studentRepository.getHistoryTransaction();
  }
}
