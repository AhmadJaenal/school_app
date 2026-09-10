import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';

abstract interface class ParentsRepository {
  Future<Either<Failure, bool>> linkStudentToParent(
    int parentId,
    dynamic params,
  );
}
