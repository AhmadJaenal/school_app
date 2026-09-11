import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/subjects/data/models/subject_model.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

abstract class SubjectRemoteDataSource {
  Future<Either<Failure, PaginationResult<SubjectModel>>> getSubjects();
  Future<Either<Failure, SubjectModel>> postSubject(params);
  Future<Either<Failure, SubjectModel>> getDetailSubject(int id);
  Future<Either<Failure, SubjectModel>> updateSubject(int id);
  Future<Either<Failure, bool>> deleteSubject(int id);
  Future<Either<Failure, bool>> assignTeacherToSubject(int id);
}

class SubjectRemoteDataSourceImpl extends RepositoryHelper
    implements SubjectRemoteDataSource {
  @override
  Future<Either<Failure, PaginationResult<SubjectModel>>> getSubjects() {
    var dioCall = dioClient.getRequest(URLs.subjects);

    return callApiWithPaginationData(
      api: dioCall,
      jsonCallback: (json) => SubjectModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, SubjectModel>> postSubject(params) {
    var dioCall = dioClient.postRequest(URLs.subjects, data: params);

    return callApi(
      api: dioCall,
      jsonCallback: (json) => SubjectModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, SubjectModel>> getDetailSubject(int id) {
    var dioCall = dioClient.getRequest("${URLs.subjects}/$id");

    return callApi(
      api: dioCall,
      jsonCallback: (json) => SubjectModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, SubjectModel>> updateSubject(int id) {
    var dioCall = dioClient.putRequest("${URLs.subjects}/$id");

    return callApi(
      api: dioCall,
      jsonCallback: (json) => SubjectModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, bool>> deleteSubject(int id) {
    var dioCall = dioClient.deleteRequest("${URLs.subjects}/$id", data: null);

    return callApiBool(api: dioCall);
  }

  @override
  Future<Either<Failure, bool>> assignTeacherToSubject(int id) {
    var dioCall = dioClient.postRequest("${URLs.subjects}/$id/assign-teacher");

    return callApiBool(api: dioCall);
  }
}
