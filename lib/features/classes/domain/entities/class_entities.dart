class ClassEntity {
  const ClassEntity({
    this.id,
    this.schoolId,
    this.name,
    this.code,
    this.capacity,
  });

  final String? id;
  final String? schoolId;
  final String? name;
  final String? code;
  final int? capacity;
}

class ClassDetailEntity extends ClassEntity {
  const ClassDetailEntity({
    super.id,
    super.schoolId,
    super.name,
    super.code,
    super.capacity,
    this.academicYearId,
    this.gradeLevel,
    this.homeroomTeacherId,
    this.academicYear,
    this.homeroomTeacher,
    this.students = const [],
  });

  final String? academicYearId;
  final String? gradeLevel;
  final String? homeroomTeacherId;
  final AcademicYearEntity? academicYear;
  final TeacherEntity? homeroomTeacher;
  final List<StudentEntity> students;
}

class AcademicYearEntity {
  const AcademicYearEntity({this.id, this.name, this.startDate, this.endDate});
  final String? id;
  final String? name;
  final String? startDate;
  final String? endDate;
}

class TeacherEntity {
  const TeacherEntity({this.id, this.userId, this.fullName, this.phoneNumber});
  final String? id;
  final String? userId;
  final String? fullName;
  final String? phoneNumber;
}

class StudentEntity {
  const StudentEntity({
    this.id,
    this.userId,
    this.schoolId,
    this.classId,
    this.studentNumber,
    this.nationalStudentNumber,
    this.fullName,
    this.gender,
    this.status,
  });

  final String? id;
  final String? userId;
  final String? schoolId;
  final String? classId;
  final String? studentNumber;
  final String? nationalStudentNumber;
  final String? fullName;
  final String? gender;
  final String? status;
}
