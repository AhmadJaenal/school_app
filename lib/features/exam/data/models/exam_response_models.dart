class ExamModel {
  const ExamModel({
    this.id,
    this.schoolId,
    this.classId,
    this.subjectId,
    this.academicYearId,
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
  final String? academicYearId;
  final String? examName;
  final String? examType;
  final String? date;
  final String? startTime;
  final String? endTime;
  final int? durationMinutes;
  final bool? isCancelled;
  final String? room;
  final String? supervisorId;
  final List<ExamQuestionModel> questions;
  final List<ExamParticipantModel> participants;

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
    id: json['id']?.toString(),
    schoolId: json['school_id']?.toString(),
    classId: json['class_id']?.toString(),
    subjectId: json['subject_id']?.toString(),
    academicYearId: json['academic_year_id']?.toString(),
    examName: json['exam_name'] as String?,
    examType: json['exam_type'] as String?,
    date: json['date'] as String?,
    startTime: json['start_time'] as String?,
    endTime: json['end_time'] as String?,
    durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
    isCancelled: json['is_cancelled'] as bool?,
    room: json['room'] as String?,
    supervisorId: json['supervisor_id']?.toString(),
    questions: _readList(json['questions'], ExamQuestionModel.fromJson),
    participants: _readList(
      json['participants'],
      ExamParticipantModel.fromJson,
    ),
  );
}

class ExamQuestionModel {
  const ExamQuestionModel({
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
  final List<ExamOptionModel> options;

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) =>
      ExamQuestionModel(
        id: json['id']?.toString(),
        examId: json['exam_id']?.toString(),
        questionType: json['question_type'] as String?,
        question: json['question'] as String?,
        order: (json['order'] as num?)?.toInt(),
        scoreWeight: (json['score_weight'] as num?)?.toDouble(),
        options: _readList(json['options'], ExamOptionModel.fromJson),
      );
}

class ExamOptionModel {
  const ExamOptionModel({
    this.id,
    this.questionId,
    this.optionText,
    this.isCorrect,
  });

  final String? id;
  final String? questionId;
  final String? optionText;
  final bool? isCorrect;

  factory ExamOptionModel.fromJson(Map<String, dynamic> json) =>
      ExamOptionModel(
        id: json['id']?.toString(),
        questionId: json['question_id']?.toString(),
        optionText: json['option_text'] as String?,
        isCorrect: json['is_correct'] as bool?,
      );
}

class ExamParticipantModel {
  const ExamParticipantModel({
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
  final ExamStudentSummaryModel? student;
  final List<ExamAnswerModel> answers;

  factory ExamParticipantModel.fromJson(Map<String, dynamic> json) =>
      ExamParticipantModel(
        id: json['id']?.toString(),
        examId: json['exam_id']?.toString(),
        studentId: json['student_id']?.toString(),
        status: json['status'] as String?,
        startedAt: json['started_at'] as String?,
        submittedAt: json['submitted_at'] as String?,
        finalScore: (json['final_score'] as num?)?.toDouble(),
        student: json['student'] is Map<String, dynamic>
            ? ExamStudentSummaryModel.fromJson(
                json['student'] as Map<String, dynamic>,
              )
            : null,
        answers: _readList(json['answers'], ExamAnswerModel.fromJson),
      );
}

class ExamStudentSummaryModel {
  const ExamStudentSummaryModel({this.id, this.studentNumber, this.fullName});

  final String? id;
  final String? studentNumber;
  final String? fullName;

  factory ExamStudentSummaryModel.fromJson(Map<String, dynamic> json) =>
      ExamStudentSummaryModel(
        id: json['id']?.toString(),
        studentNumber: json['student_number'] as String?,
        fullName: json['full_name'] as String?,
      );
}

class ExamAnswerModel {
  const ExamAnswerModel({
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

  factory ExamAnswerModel.fromJson(Map<String, dynamic> json) =>
      ExamAnswerModel(
        id: json['id']?.toString(),
        examParticipantId: json['exam_participant_id']?.toString(),
        questionId: json['question_id']?.toString(),
        selectedOptionId: json['selected_option_id']?.toString(),
        essayAnswer: json['essay_answer'] as String?,
        questionScore: (json['question_score'] as num?)?.toDouble(),
      );
}

class ExamStartResponseModel {
  const ExamStartResponseModel({this.participant, this.questions = const []});

  final ExamParticipantModel? participant;
  final List<ExamQuestionModel> questions;

  factory ExamStartResponseModel.fromJson(Map<String, dynamic> json) =>
      ExamStartResponseModel(
        participant: json['participant'] is Map<String, dynamic>
            ? ExamParticipantModel.fromJson(
                json['participant'] as Map<String, dynamic>,
              )
            : null,
        questions: _readList(json['questions'], ExamQuestionModel.fromJson),
      );
}

List<T> _readList<T>(dynamic value, T Function(Map<String, dynamic>) fromJson) {
  if (value is! List) return const [];
  return value
      .whereType<Map<String, dynamic>>()
      .map(fromJson)
      .toList(growable: false);
}
