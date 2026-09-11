import 'package:school_app/features/exam/domain/entities/exam_entities.dart';

class ExamModel extends ExamEntity {
  const ExamModel({
    super.id,
    super.schoolId,
    super.classId,
    super.subjectId,
    super.examName,
    super.examType,
    super.date,
    super.academicYearId,
    super.startTime,
    super.endTime,
    super.durationMinutes,
    super.isCancelled,
    super.room,
    super.supervisorId,
    super.questions,
    super.participants,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
    id: json['id']?.toString(),
    schoolId: json['school_id']?.toString(),
    classId: json['class_id']?.toString(),
    subjectId: json['subject_id']?.toString(),
    examName: json['exam_name'] as String?,
    examType: json['exam_type'] as String?,
    date: json['date'] as String?,
    academicYearId: json['academic_year_id']?.toString(),
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

  Map<String, dynamic> toJson() => {
    'id': id,
    'school_id': schoolId,
    'class_id': classId,
    'subject_id': subjectId,
    'exam_name': examName,
    'exam_type': examType,
    'date': date,
    'academic_year_id': academicYearId,
    'start_time': startTime,
    'end_time': endTime,
    'duration_minutes': durationMinutes,
    'is_cancelled': isCancelled,
    'room': room,
    'supervisor_id': supervisorId,
    'questions': questions
        .map((item) => (item as ExamQuestionModel).toJson())
        .toList(),
    'participants': participants
        .map((item) => (item as ExamParticipantModel).toJson())
        .toList(),
  };
}

class ExamQuestionModel extends ExamQuestionEntity {
  const ExamQuestionModel({
    super.id,
    super.examId,
    super.questionType,
    super.question,
    super.order,
    super.scoreWeight,
    super.options,
  });

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

  Map<String, dynamic> toJson() => {
    'id': id,
    'exam_id': examId,
    'question_type': questionType,
    'question': question,
    'order': order,
    'score_weight': scoreWeight,
    'options': options
        .map((item) => (item as ExamOptionModel).toJson())
        .toList(),
  };
}

class ExamOptionModel extends ExamOptionEntity {
  const ExamOptionModel({
    super.id,
    super.questionId,
    super.optionText,
    super.isCorrect,
  });

  factory ExamOptionModel.fromJson(Map<String, dynamic> json) =>
      ExamOptionModel(
        id: json['id']?.toString(),
        questionId: json['question_id']?.toString(),
        optionText: json['option_text'] as String?,
        isCorrect: json['is_correct'] as bool?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'question_id': questionId,
    'option_text': optionText,
    'is_correct': isCorrect,
  };
}

class ExamParticipantModel extends ExamParticipantEntity {
  const ExamParticipantModel({
    super.id,
    super.examId,
    super.studentId,
    super.status,
    super.startedAt,
    super.submittedAt,
    super.finalScore,
    super.student,
    super.answers,
  });

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

  Map<String, dynamic> toJson() => {
    'id': id,
    'exam_id': examId,
    'student_id': studentId,
    'status': status,
    'started_at': startedAt,
    'submitted_at': submittedAt,
    'final_score': finalScore,
    'student': (student as ExamStudentSummaryModel?)?.toJson(),
    'answers': answers
        .map((item) => (item as ExamAnswerModel).toJson())
        .toList(),
  };
}

class ExamStudentSummaryModel extends ExamStudentEntity {
  const ExamStudentSummaryModel({
    super.id,
    super.studentNumber,
    super.fullName,
  });

  factory ExamStudentSummaryModel.fromJson(Map<String, dynamic> json) =>
      ExamStudentSummaryModel(
        id: json['id']?.toString(),
        studentNumber: json['student_number'] as String?,
        fullName: json['full_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'student_number': studentNumber,
    'full_name': fullName,
  };
}

class ExamAnswerModel extends ExamAnswerEntity {
  const ExamAnswerModel({
    super.id,
    super.examParticipantId,
    super.questionId,
    super.selectedOptionId,
    super.essayAnswer,
    super.questionScore,
  });

  factory ExamAnswerModel.fromJson(Map<String, dynamic> json) =>
      ExamAnswerModel(
        id: json['id']?.toString(),
        examParticipantId: json['exam_participant_id']?.toString(),
        questionId: json['question_id']?.toString(),
        selectedOptionId: json['selected_option_id']?.toString(),
        essayAnswer: json['essay_answer'] as String?,
        questionScore: (json['question_score'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'exam_participant_id': examParticipantId,
    'question_id': questionId,
    'selected_option_id': selectedOptionId,
    'essay_answer': essayAnswer,
    'question_score': questionScore,
  };
}

class ExamStartResponseModel extends ExamStartEntity {
  const ExamStartResponseModel({super.participant, super.questions});

  factory ExamStartResponseModel.fromJson(Map<String, dynamic> json) =>
      ExamStartResponseModel(
        participant: json['participant'] is Map<String, dynamic>
            ? ExamParticipantModel.fromJson(
                json['participant'] as Map<String, dynamic>,
              )
            : null,
        questions: _readList(json['questions'], ExamQuestionModel.fromJson),
      );

  Map<String, dynamic> toJson() => {
    'participant': (participant as ExamParticipantModel?)?.toJson(),
    'questions': questions
        .map((item) => (item as ExamQuestionModel).toJson())
        .toList(),
  };
}

List<T> _readList<T>(dynamic value, T Function(Map<String, dynamic>) fromJson) {
  if (value is! List) return const [];
  return value
      .whereType<Map<String, dynamic>>()
      .map(fromJson)
      .toList(growable: false);
}
