import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

abstract class ExamRemoteDataSource {
  Future<Either<Failure, PaginationResult<ExamModel>>> getExams();
  Future<Either<Failure, ExamModel>> getExam(int id);
  Future<Either<Failure, PaginationResult<Map<String, dynamic>>>> getQuestions(
    int examId,
  );
  Future<Either<Failure, bool>> startExam(int id);
  Future<Either<Failure, bool>> answerExam(int id, dynamic params);
  Future<Either<Failure, bool>> submitExam(int id);
  Future<Either<Failure, bool>> gradeEssay(
    int examId,
    int participantId,
    dynamic params,
  );
  Future<Either<Failure, PaginationResult<Map<String, dynamic>>>> getResults(
    int id,
  );
  Future<Either<Failure, Map<String, dynamic>>> getMyResult(int id);
}

class ExamRemoteDataSourceImpl extends RepositoryHelper
    implements ExamRemoteDataSource {
  @override
  Future<Either<Failure, PaginationResult<ExamModel>>> getExams() {
    return callApiWithPaginationData(
      api: dioClient.getRequest(URLs.exams),
      jsonCallback: (json) => ExamModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, ExamModel>> getExam(int id) => callApi(
    api: dioClient.getRequest(URLs.detailExam(id)),
    jsonCallback: (json) => ExamModel.fromJson(json),
  );

  @override
  Future<Either<Failure, PaginationResult<Map<String, dynamic>>>> getQuestions(
    int examId,
  ) => callApiWithPaginationData(
    api: dioClient.getRequest(URLs.examQuestions(examId)),
    jsonCallback: (json) => Map<String, dynamic>.from(json as Map),
  );

  @override
  Future<Either<Failure, bool>> startExam(int id) =>
      callApiBool(api: dioClient.postRequest(URLs.startExam(id)));

  @override
  Future<Either<Failure, bool>> answerExam(int id, dynamic params) =>
      callApiBool(
        api: dioClient.postRequest(URLs.examAnswer(id), data: params),
      );

  @override
  Future<Either<Failure, bool>> submitExam(int id) =>
      callApiBool(api: dioClient.postRequest(URLs.submitExam(id)));

  @override
  Future<Either<Failure, bool>> gradeEssay(
    int examId,
    int participantId,
    dynamic params,
  ) => callApiBool(
    api: dioClient.postRequest(
      URLs.gradeEssay(examId: examId, participantId: participantId),
      data: params,
    ),
  );

  @override
  Future<Either<Failure, PaginationResult<Map<String, dynamic>>>> getResults(
    int id,
  ) => callApiWithPaginationData(
    api: dioClient.getRequest(URLs.examResults(id)),
    jsonCallback: (json) => Map<String, dynamic>.from(json as Map),
  );

  @override
  Future<Either<Failure, Map<String, dynamic>>> getMyResult(int id) => callApi(
    api: dioClient.getRequest(URLs.myExamResult(id)),
    jsonCallback: (json) => Map<String, dynamic>.from(json as Map),
  );
}
