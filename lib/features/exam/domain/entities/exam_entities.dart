class ExamEntity {
  const ExamEntity({
    this.id,
    this.schoolId,
    this.classId,
    this.subjectId,
    this.examName,
    this.examType,
    this.date,
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
  final String? startTime;
  final String? endTime;
  final int? durationMinutes;
  final bool? isCancelled;
  final String? room;
  final String? supervisorId;
  final List<ExamQuestionEntity> questions;
  final List<ExamParticipantEntity> participants;
}

class ExamQuestionEntity {
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
}

class ExamOptionEntity {
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
}

class ExamParticipantEntity {
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
}

class ExamStudentEntity {
  const ExamStudentEntity({this.id, this.studentNumber, this.fullName});
  final String? id;
  final String? studentNumber;
  final String? fullName;
}

class ExamAnswerEntity {
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
}

class ExamStartEntity {
  const ExamStartEntity({this.participant, this.questions = const []});
  final ExamParticipantEntity? participant;
  final List<ExamQuestionEntity> questions;
}
