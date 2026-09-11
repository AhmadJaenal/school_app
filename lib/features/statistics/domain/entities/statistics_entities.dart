import 'package:equatable/equatable.dart';

class StudentGradeStatisticsEntity extends Equatable {
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

  @override
  List<Object?> get props => [
    studentId,
    studentName,
    subjectId,
    subjectName,
    academicYearId,
    gradeType,
    average,
    minimum,
    maximum,
    gradeCount,
  ];
}

class StudentAttendanceSummaryEntity extends Equatable {
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

  @override
  List<Object?> get props => [
    studentId,
    studentName,
    year,
    month,
    totalPresent,
    totalSick,
    totalExcused,
    totalAbsent,
    totalRecordedDays,
  ];
}

class ClassGradeStatisticsEntity extends Equatable {
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

  @override
  List<Object?> get props => [
    classId,
    className,
    subjectId,
    subjectName,
    gradeType,
    academicYearId,
    average,
    lowest,
    highest,
    gradedStudentCount,
  ];
}

class AttendanceStatusTotalEntity extends Equatable {
  const AttendanceStatusTotalEntity({this.status, this.total});
  final String? status;
  final int? total;

  @override
  List<Object?> get props => [status, total];
}

class ClassAttendanceSummaryEntity extends Equatable {
  const ClassAttendanceSummaryEntity({this.items = const []});
  final List<AttendanceStatusTotalEntity> items;

  @override
  List<Object?> get props => [items];
}

class StudentReportSubjectEntity extends Equatable {
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

  @override
  List<Object?> get props => [subjectId, subjectName, gradeType, grade];
}

class StudentReportEntity extends Equatable {
  const StudentReportEntity({this.subjects = const {}});
  final Map<String, List<StudentReportSubjectEntity>> subjects;

  @override
  List<Object?> get props => [subjects];
}

class SchoolOverviewEntity extends Equatable {
  const SchoolOverviewEntity({
    this.totalStudents,
    this.attendance = const [],
    this.averageGrade,
  });
  final int? totalStudents;
  final List<AttendanceStatusTotalEntity> attendance;
  final double? averageGrade;

  @override
  List<Object?> get props => [totalStudents, attendance, averageGrade];
}
