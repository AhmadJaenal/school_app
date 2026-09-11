import 'package:school_app/features/statistics/domain/entities/statistics_entities.dart';

class StudentGradeStatisticsModel extends StudentGradeStatisticsEntity {
  const StudentGradeStatisticsModel({
    super.studentId,
    super.studentName,
    super.subjectId,
    super.subjectName,
    super.academicYearId,
    super.gradeType,
    super.average,
    super.minimum,
    super.maximum,
    super.gradeCount,
  });

  factory StudentGradeStatisticsModel.fromJson(Map<String, dynamic> json) =>
      StudentGradeStatisticsModel(
        studentId: json['student_id']?.toString(),
        studentName: json['student_name'] as String?,
        subjectId: json['subject_id']?.toString(),
        subjectName: json['subject_name'] as String?,
        academicYearId: json['academic_year_id']?.toString(),
        gradeType: json['grade_type'] as String?,
        average: (json['average'] as num?)?.toDouble(),
        minimum: (json['minimum'] as num?)?.toDouble(),
        maximum: (json['maximum'] as num?)?.toDouble(),
        gradeCount: (json['grade_count'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
    'student_id': studentId,
    'student_name': studentName,
    'subject_id': subjectId,
    'subject_name': subjectName,
    'academic_year_id': academicYearId,
    'grade_type': gradeType,
    'average': average,
    'minimum': minimum,
    'maximum': maximum,
    'grade_count': gradeCount,
  };
}

class StudentAttendanceSummaryModel extends StudentAttendanceSummaryEntity {
  const StudentAttendanceSummaryModel({
    super.studentId,
    super.studentName,
    super.year,
    super.month,
    super.totalPresent,
    super.totalSick,
    super.totalExcused,
    super.totalAbsent,
    super.totalRecordedDays,
  });

  factory StudentAttendanceSummaryModel.fromJson(Map<String, dynamic> json) =>
      StudentAttendanceSummaryModel(
        studentId: json['student_id']?.toString(),
        studentName: json['student_name'] as String?,
        year: (json['year'] as num?)?.toInt(),
        month: (json['month'] as num?)?.toInt(),
        totalPresent: (json['total_present'] as num?)?.toInt(),
        totalSick: (json['total_sick'] as num?)?.toInt(),
        totalExcused: (json['total_excused'] as num?)?.toInt(),
        totalAbsent: (json['total_absent'] as num?)?.toInt(),
        totalRecordedDays: (json['total_recorded_days'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
    'student_id': studentId,
    'student_name': studentName,
    'year': year,
    'month': month,
    'total_present': totalPresent,
    'total_sick': totalSick,
    'total_excused': totalExcused,
    'total_absent': totalAbsent,
    'total_recorded_days': totalRecordedDays,
  };
}

class ClassGradeStatisticsModel extends ClassGradeStatisticsEntity {
  const ClassGradeStatisticsModel({
    super.classId,
    super.className,
    super.subjectId,
    super.subjectName,
    super.gradeType,
    super.academicYearId,
    super.average,
    super.lowest,
    super.highest,
    super.gradedStudentCount,
  });

  factory ClassGradeStatisticsModel.fromJson(Map<String, dynamic> json) =>
      ClassGradeStatisticsModel(
        classId: json['class_id']?.toString(),
        className: json['class_name'] as String?,
        subjectId: json['subject_id']?.toString(),
        subjectName: json['subject_name'] as String?,
        gradeType: json['grade_type'] as String?,
        academicYearId: json['academic_year_id']?.toString(),
        average: (json['class_average'] as num?)?.toDouble(),
        lowest: (json['lowest_grade'] as num?)?.toDouble(),
        highest: (json['highest_grade'] as num?)?.toDouble(),
        gradedStudentCount: (json['graded_student_count'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
    'class_id': classId,
    'class_name': className,
    'subject_id': subjectId,
    'subject_name': subjectName,
    'grade_type': gradeType,
    'academic_year_id': academicYearId,
    'class_average': average,
    'lowest_grade': lowest,
    'highest_grade': highest,
    'graded_student_count': gradedStudentCount,
  };
}

class AttendanceStatusTotalModel extends AttendanceStatusTotalEntity {
  const AttendanceStatusTotalModel({super.status, super.total});

  factory AttendanceStatusTotalModel.fromJson(Map<String, dynamic> json) =>
      AttendanceStatusTotalModel(
        status: json['status'] as String?,
        total: (json['total'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {'status': status, 'total': total};
}

class ClassAttendanceSummaryModel extends ClassAttendanceSummaryEntity {
  const ClassAttendanceSummaryModel({super.items});

  factory ClassAttendanceSummaryModel.fromJson(dynamic json) =>
      ClassAttendanceSummaryModel(
        items: json is List
            ? json
                  .whereType<Map<String, dynamic>>()
                  .map(AttendanceStatusTotalModel.fromJson)
                  .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toJson() => {
    'items': items
        .map((item) => (item as AttendanceStatusTotalModel).toJson())
        .toList(),
  };
}

class StudentReportSubjectModel extends StudentReportSubjectEntity {
  const StudentReportSubjectModel({
    super.subjectId,
    super.subjectName,
    super.gradeType,
    super.grade,
  });

  factory StudentReportSubjectModel.fromJson(Map<String, dynamic> json) =>
      StudentReportSubjectModel(
        subjectId: json['id']?.toString(),
        subjectName: json['subject_name'] as String?,
        gradeType: json['grade_type'] as String?,
        grade: (json['grade'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    'id': subjectId,
    'subject_name': subjectName,
    'grade_type': gradeType,
    'grade': grade,
  };
}

class StudentReportModel extends StudentReportEntity {
  const StudentReportModel({super.subjects});

  factory StudentReportModel.fromJson(Map<String, dynamic> json) {
    final result = <String, List<StudentReportSubjectEntity>>{};
    for (final entry in json.entries) {
      if (entry.value is List) {
        result[entry.key] = (entry.value as List)
            .whereType<Map<String, dynamic>>()
            .map(StudentReportSubjectModel.fromJson)
            .toList(growable: false);
      }
    }
    return StudentReportModel(subjects: result);
  }

  Map<String, dynamic> toJson() => {
    for (final entry in subjects.entries)
      entry.key: entry.value
          .map((item) => (item as StudentReportSubjectModel).toJson())
          .toList(),
  };
}

class SchoolOverviewModel extends SchoolOverviewEntity {
  const SchoolOverviewModel({
    super.totalStudents,
    super.attendance,
    super.averageGrade,
  });

  factory SchoolOverviewModel.fromJson(Map<String, dynamic> json) =>
      SchoolOverviewModel(
        totalStudents: (json['total_students'] as num?)?.toInt(),
        attendance: json['attendance'] is List
            ? (json['attendance'] as List)
                  .whereType<Map<String, dynamic>>()
                  .map(AttendanceStatusTotalModel.fromJson)
                  .toList(growable: false)
            : const [],
        averageGrade: (json['average_grade'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    'total_students': totalStudents,
    'attendance': attendance
        .map((item) => (item as AttendanceStatusTotalModel).toJson())
        .toList(),
    'average_grade': averageGrade,
  };
}
