class StudentGradeStatisticsEntity {
  const StudentGradeStatisticsEntity({
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
}

class StudentAttendanceSummaryEntity {
  const StudentAttendanceSummaryEntity({
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
}

class ClassGradeStatisticsEntity {
  const ClassGradeStatisticsEntity({
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
}

class AttendanceStatusTotalEntity {
  const AttendanceStatusTotalEntity({this.status, this.total});
  final String? status;
  final int? total;
}

class ClassAttendanceSummaryEntity {
  const ClassAttendanceSummaryEntity({this.items = const []});
  final List<AttendanceStatusTotalEntity> items;
}

class StudentReportSubjectEntity {
  const StudentReportSubjectEntity({
    this.subjectId,
    this.subjectName,
    this.gradeType,
    this.grade,
  });
  final String? subjectId;
  final String? subjectName;
  final String? gradeType;
  final double? grade;
}

class StudentReportEntity {
  const StudentReportEntity({this.subjects = const {}});
  final Map<String, List<StudentReportSubjectEntity>> subjects;
}

class SchoolOverviewEntity {
  const SchoolOverviewEntity({
    this.totalStudents,
    this.attendance = const [],
    this.averageGrade,
  });
  final int? totalStudents;
  final List<AttendanceStatusTotalEntity> attendance;
  final double? averageGrade;
}
