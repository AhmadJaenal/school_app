import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/parents/data/datasources/parents_remote_data_source.dart';
import 'package:school_app/features/parents/domain/repositories/parents_repository.dart';

class ParentsRepositoryImpl implements ParentsRepository {
  ParentsRepositoryImpl(this._dataSource);
  final ParentsRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, bool>> linkStudentToParent(
    int parentId,
    dynamic params,
  ) => _dataSource.linkStudentToParent(parentId, params);
}
