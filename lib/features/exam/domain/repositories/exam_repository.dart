import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/exam/domain/entities/exam_entities.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class ExamRepository {
  Future<Either<Failure, PaginationResult<ExamEntity>>> getExams();
  Future<Either<Failure, ExamEntity>> getExamDetail(int id);
  Future<Either<Failure, PaginationResult<ExamQuestionEntity>>> getQuestions(
    int examId,
  );
  Future<Either<Failure, ExamStartEntity>> startExam(int examId);
  Future<Either<Failure, ExamAnswerEntity>> answerExam(
    int examId,
    dynamic params,
  );
  Future<Either<Failure, ExamParticipantEntity>> submitExam(int examId);
  Future<Either<Failure, ExamAnswerEntity>> gradeEssay(
    int examId,
    int participantId,
    dynamic params,
  );
  Future<Either<Failure, PaginationResult<ExamParticipantEntity>>> getResults(
    int examId,
  );
  Future<Either<Failure, ExamParticipantEntity>> getMyResult(int examId);
}
