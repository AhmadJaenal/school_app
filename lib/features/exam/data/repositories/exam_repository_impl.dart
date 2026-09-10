import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/exam/data/datasources/exam_remote_data_source.dart';
import 'package:school_app/features/exam/data/models/exam_response_models.dart';
import 'package:school_app/features/exam/domain/repositories/exam_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class ExamRepositoryImpl implements ExamRepository {
  ExamRepositoryImpl(this._dataSource);
  final ExamRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<ExamModel>>> getExams() =>
      _dataSource.getExams();
  @override
  Future<Either<Failure, ExamModel>> getExamDetail(int id) =>
      _dataSource.getExam(id);
  @override
  Future<Either<Failure, PaginationResult<ExamQuestionModel>>> getQuestions(
    int examId,
  ) => _dataSource.getQuestions(examId);
  @override
  Future<Either<Failure, ExamStartResponseModel>> startExam(int examId) =>
      _dataSource.startExam(examId);
  @override
  Future<Either<Failure, ExamAnswerModel>> answerExam(
    int examId,
    dynamic params,
  ) => _dataSource.answerExam(examId, params);
  @override
  Future<Either<Failure, ExamParticipantModel>> submitExam(int examId) =>
      _dataSource.submitExam(examId);
  @override
  Future<Either<Failure, ExamAnswerModel>> gradeEssay(
    int examId,
    int participantId,
    dynamic params,
  ) => _dataSource.gradeEssay(examId, participantId, params);
  @override
  Future<Either<Failure, PaginationResult<ExamParticipantModel>>> getResults(
    int examId,
  ) => _dataSource.getResults(examId);
  @override
  Future<Either<Failure, ExamParticipantModel>> getMyResult(int examId) =>
      _dataSource.getMyResult(examId);
}
