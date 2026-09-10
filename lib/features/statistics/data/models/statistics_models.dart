class StudentGradeStatisticsModel {
  const StudentGradeStatisticsModel({
    this.studentId,
    this.studentName,
    this.subjectId,
    this.subjectName,
    this.academicYearId,
    this.gradeType,
    this.average,
    this.minimum,
    this.maximum,
    this.gradeCount,
  });

  final String? studentId;
  final String? studentName;
  final String? subjectId;
  final String? subjectName;
  final String? academicYearId;
  final String? gradeType;
  final double? average;
  final double? minimum;
  final double? maximum;
  final int? gradeCount;

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
}

class StudentAttendanceSummaryModel {
  const StudentAttendanceSummaryModel({
    this.studentId,
    this.studentName,
    this.year,
    this.month,
    this.totalPresent,
    this.totalSick,
    this.totalExcused,
    this.totalAbsent,
    this.totalRecordedDays,
  });

  final String? studentId;
  final String? studentName;
  final int? year;
  final int? month;
  final int? totalPresent;
  final int? totalSick;
  final int? totalExcused;
  final int? totalAbsent;
  final int? totalRecordedDays;

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
}

class ClassGradeStatisticsModel {
  const ClassGradeStatisticsModel({
    this.classId,
    this.className,
    this.subjectId,
    this.subjectName,
    this.gradeType,
    this.academicYearId,
    this.average,
    this.lowest,
    this.highest,
    this.gradedStudentCount,
  });

  final String? classId;
  final String? className;
  final String? subjectId;
  final String? subjectName;
  final String? gradeType;
  final String? academicYearId;
  final double? average;
  final double? lowest;
  final double? highest;
  final int? gradedStudentCount;

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
}

class AttendanceStatusTotalModel {
  const AttendanceStatusTotalModel({this.status, this.total});

  final String? status;
  final int? total;

  factory AttendanceStatusTotalModel.fromJson(Map<String, dynamic> json) =>
      AttendanceStatusTotalModel(
        status: json['status'] as String?,
        total: (json['total'] as num?)?.toInt(),
      );
}

class ClassAttendanceSummaryModel {
  const ClassAttendanceSummaryModel({this.items = const []});

  final List<AttendanceStatusTotalModel> items;

  factory ClassAttendanceSummaryModel.fromJson(dynamic json) =>
      ClassAttendanceSummaryModel(
        items: json is List
            ? json
                  .whereType<Map<String, dynamic>>()
                  .map(AttendanceStatusTotalModel.fromJson)
                  .toList(growable: false)
            : const [],
      );
}

class StudentReportSubjectModel {
  const StudentReportSubjectModel({
    this.subjectId,
    this.subjectName,
    this.gradeType,
    this.grade,
  });

  final String? subjectId;
  final String? subjectName;
  final String? gradeType;
  final double? grade;

  factory StudentReportSubjectModel.fromJson(Map<String, dynamic> json) =>
      StudentReportSubjectModel(
        subjectId: json['id']?.toString(),
        subjectName: json['subject_name'] as String?,
        gradeType: json['grade_type'] as String?,
        grade: (json['grade'] as num?)?.toDouble(),
      );
}

class StudentReportModel {
  const StudentReportModel({this.subjects = const {}});

  final Map<String, List<StudentReportSubjectModel>> subjects;

  factory StudentReportModel.fromJson(Map<String, dynamic> json) {
    final result = <String, List<StudentReportSubjectModel>>{};
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
}

class SchoolOverviewModel {
  const SchoolOverviewModel({
    this.totalStudents,
    this.attendance = const [],
    this.averageGrade,
  });

  final int? totalStudents;
  final List<AttendanceStatusTotalModel> attendance;
  final double? averageGrade;

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
}
