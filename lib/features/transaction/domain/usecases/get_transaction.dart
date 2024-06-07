import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/transaction_entity.dart';
import '../repositories/transaction_repository.dart';

class GetHistoryTransaction {
  final TransactionRepository transactionRepository;

  const GetHistoryTransaction(this.transactionRepository);

  Future<Either<Failure, List<TransactionEntity>>> execute() async {
    return await transactionRepository.getHistoryTransaction();
  }
}
