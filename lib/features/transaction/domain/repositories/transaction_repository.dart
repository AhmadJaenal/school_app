import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../transaction/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionEntity>>> getHistoryTransaction();
}
