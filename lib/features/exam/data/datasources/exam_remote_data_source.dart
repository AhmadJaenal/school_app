import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/exam/data/models/exam_response_models.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

abstract class ExamRemoteDataSource {
  Future<Either<Failure, PaginationResult<ExamModel>>> getExams();
  Future<Either<Failure, ExamModel>> getExam(int id);
  Future<Either<Failure, ExamStartResponseModel>> startExam(int id);
  Future<Either<Failure, ExamAnswerModel>> answerExam(int id, dynamic params);
  Future<Either<Failure, ExamParticipantModel>> submitExam(int id);
  Future<Either<Failure, ExamAnswerModel>> gradeEssay(
    int examId,
    int participantId,
    dynamic params,
  );
  Future<Either<Failure, PaginationResult<ExamQuestionModel>>> getQuestions(
    int examId,
  );
  Future<Either<Failure, PaginationResult<ExamParticipantModel>>> getResults(
    int id,
  );
  Future<Either<Failure, ExamParticipantModel>> getMyResult(int id);
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
  Future<Either<Failure, PaginationResult<ExamQuestionModel>>> getQuestions(
    int examId,
  ) => callApiWithPaginationData(
    api: dioClient.getRequest(URLs.examQuestions(examId)),
    jsonCallback: (json) => ExamQuestionModel.fromJson(json),
  );

  @override
  Future<Either<Failure, ExamStartResponseModel>> startExam(int id) => callApi(
    api: dioClient.postRequest(URLs.startExam(id)),
    jsonCallback: (json) => ExamStartResponseModel.fromJson(json),
  );

  @override
  Future<Either<Failure, ExamAnswerModel>> answerExam(int id, dynamic params) =>
      callApi(
        api: dioClient.putRequest(URLs.examAnswer(id), data: params),
        jsonCallback: (json) => ExamAnswerModel.fromJson(json),
      );

  @override
  Future<Either<Failure, ExamParticipantModel>> submitExam(int id) => callApi(
    api: dioClient.postRequest(URLs.submitExam(id)),
    jsonCallback: (json) => ExamParticipantModel.fromJson(json),
  );

  @override
  Future<Either<Failure, ExamAnswerModel>> gradeEssay(
    int examId,
    int participantId,
    dynamic params,
  ) => callApi(
    api: dioClient.putRequest(
      URLs.gradeEssay(examId: examId, participantId: participantId),
      data: params,
    ),
    jsonCallback: (json) => ExamAnswerModel.fromJson(json),
  );

  @override
  Future<Either<Failure, PaginationResult<ExamParticipantModel>>> getResults(
    int id,
  ) => callApiWithPaginationData(
    api: dioClient.getRequest(URLs.examResults(id)),
    jsonCallback: (json) => ExamParticipantModel.fromJson(json),
  );

  @override
  Future<Either<Failure, ExamParticipantModel>> getMyResult(int id) => callApi(
    api: dioClient.getRequest(URLs.myExamResult(id)),
    jsonCallback: (json) => ExamParticipantModel.fromJson(json),
  );
}
