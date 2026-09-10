import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/network/urls.dart';

abstract class ParentsRemoteDataSource {
  Future<Either<Failure, bool>> linkStudentToParent(
    int parentId,
    dynamic params,
  );
}

class ParentsRemoteDataSourceImpl extends RepositoryHelper
    implements ParentsRemoteDataSource {
  @override
  Future<Either<Failure, bool>> linkStudentToParent(
    int parentId,
    dynamic params,
  ) => callApiBool(
    api: dioClient.postRequest(
      URLs.linkStudentToParent(parentId),
      data: params,
    ),
  );
}
