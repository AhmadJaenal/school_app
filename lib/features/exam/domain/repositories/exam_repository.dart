import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/exam/data/models/exam_response_models.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class ExamRepository {
  Future<Either<Failure, PaginationResult<ExamModel>>> getExams();
  Future<Either<Failure, ExamModel>> getExamDetail(int id);
  Future<Either<Failure, PaginationResult<ExamQuestionModel>>> getQuestions(
    int examId,
  );
  Future<Either<Failure, ExamStartResponseModel>> startExam(int examId);
  Future<Either<Failure, ExamAnswerModel>> answerExam(
    int examId,
    dynamic params,
  );
  Future<Either<Failure, ExamParticipantModel>> submitExam(int examId);
  Future<Either<Failure, ExamAnswerModel>> gradeEssay(
    int examId,
    int participantId,
    dynamic params,
  );
  Future<Either<Failure, PaginationResult<ExamParticipantModel>>> getResults(
    int examId,
  );
  Future<Either<Failure, ExamParticipantModel>> getMyResult(int examId);
}
