import 'package:equatable/equatable.dart';

class ExamEntity extends Equatable {
  const ExamEntity({
    this.id,
    this.schoolId,
    this.classId,
    this.subjectId,
    this.examName,
    this.examType,
    this.date,
    this.academicYearId,
    this.startTime,
    this.endTime,
    this.durationMinutes,
    this.isCancelled,
    this.room,
    this.supervisorId,
    this.questions = const [],
    this.participants = const [],
  });
  final String? id;
  final String? schoolId;
  final String? classId;
  final String? subjectId;
  final String? examName;
  final String? examType;
  final String? date;
  final String? academicYearId;
  final String? startTime;
  final String? endTime;
  final int? durationMinutes;
  final bool? isCancelled;
  final String? room;
  final String? supervisorId;
  final List<ExamQuestionEntity> questions;
  final List<ExamParticipantEntity> participants;

  @override
  List<Object?> get props => [
    id,
    schoolId,
    classId,
    subjectId,
    examName,
    examType,
    date,
    startTime,
    endTime,
    durationMinutes,
    isCancelled,
    room,
    supervisorId,
    questions,
    participants,
  ];
}

class ExamQuestionEntity extends Equatable {
  const ExamQuestionEntity({
    this.id,
    this.examId,
    this.questionType,
    this.question,
    this.order,
    this.scoreWeight,
    this.options = const [],
  });
  final String? id;
  final String? examId;
  final String? questionType;
  final String? question;
  final int? order;
  final double? scoreWeight;
  final List<ExamOptionEntity> options;

  @override
  List<Object?> get props => [
    id,
    examId,
    questionType,
    question,
    order,
    scoreWeight,
    options,
  ];
}

class ExamOptionEntity extends Equatable {
  const ExamOptionEntity({
    this.id,
    this.questionId,
    this.optionText,
    this.isCorrect,
  });
  final String? id;
  final String? questionId;
  final String? optionText;
  final bool? isCorrect;

  @override
  List<Object?> get props => [id, questionId, optionText, isCorrect];
}

class ExamParticipantEntity extends Equatable {
  const ExamParticipantEntity({
    this.id,
    this.examId,
    this.studentId,
    this.status,
    this.startedAt,
    this.submittedAt,
    this.finalScore,
    this.student,
    this.answers = const [],
  });
  final String? id;
  final String? examId;
  final String? studentId;
  final String? status;
  final String? startedAt;
  final String? submittedAt;
  final double? finalScore;
  final ExamStudentEntity? student;
  final List<ExamAnswerEntity> answers;

  @override
  List<Object?> get props => [
    id,
    examId,
    studentId,
    status,
    startedAt,
    submittedAt,
    finalScore,
    student,
    answers,
  ];
}

class ExamStudentEntity extends Equatable {
  const ExamStudentEntity({this.id, this.studentNumber, this.fullName});
  final String? id;
  final String? studentNumber;
  final String? fullName;

  @override
  List<Object?> get props => [id, studentNumber, fullName];
}

class ExamAnswerEntity extends Equatable {
  const ExamAnswerEntity({
    this.id,
    this.examParticipantId,
    this.questionId,
    this.selectedOptionId,
    this.essayAnswer,
    this.questionScore,
  });
  final String? id;
  final String? examParticipantId;
  final String? questionId;
  final String? selectedOptionId;
  final String? essayAnswer;
  final double? questionScore;

  @override
  List<Object?> get props => [
    id,
    examParticipantId,
    questionId,
    selectedOptionId,
    essayAnswer,
    questionScore,
  ];
}

class ExamStartEntity extends Equatable {
  const ExamStartEntity({this.participant, this.questions = const []});
  final ExamParticipantEntity? participant;
  final List<ExamQuestionEntity> questions;

  @override
  List<Object?> get props => [participant, questions];
}
