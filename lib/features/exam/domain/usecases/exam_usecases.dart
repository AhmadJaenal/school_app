import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/exam/domain/repositories/exam_repository.dart';
import 'package:school_app/features/exam/data/models/exam_response_models.dart';
import 'package:school_app/models/pagination_model.dart';

class GetExams {
  GetExams(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, PaginationResult<ExamModel>>> call() =>
      _repository.getExams();
}

class GetExamDetail {
  GetExamDetail(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, ExamModel>> call(int id) =>
      _repository.getExamDetail(id);
}

class GetExamQuestions {
  GetExamQuestions(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, PaginationResult<ExamQuestionModel>>> call(
    int examId,
  ) => _repository.getQuestions(examId);
}

class StartExam {
  StartExam(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, ExamStartResponseModel>> call(int examId) =>
      _repository.startExam(examId);
}

class AnswerExam {
  AnswerExam(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, ExamAnswerModel>> call(int examId, dynamic params) =>
      _repository.answerExam(examId, params);
}

class SubmitExam {
  SubmitExam(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, ExamParticipantModel>> call(int examId) =>
      _repository.submitExam(examId);
}

class GradeEssay {
  GradeEssay(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, ExamAnswerModel>> call(
    int examId,
    int participantId,
    dynamic params,
  ) => _repository.gradeEssay(examId, participantId, params);
}

class GetExamResults {
  GetExamResults(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, PaginationResult<ExamParticipantModel>>> call(
    int examId,
  ) => _repository.getResults(examId);
}

class GetMyExamResult {
  GetMyExamResult(this._repository);
  final ExamRepository _repository;
  Future<Either<Failure, ExamParticipantModel>> call(int examId) =>
      _repository.getMyResult(examId);
}
