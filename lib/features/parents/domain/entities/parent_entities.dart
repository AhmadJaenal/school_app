class ParentEntity {
  const ParentEntity({
    this.id,
    this.userId,
    this.fullName,
    this.phoneNumber,
    this.students = const [],
  });
  final String? id;
  final String? userId;
  final String? fullName;
  final String? phoneNumber;
  final List<LinkedStudentEntity> students;
}

class LinkedStudentEntity {
  const LinkedStudentEntity({
    this.id,
    this.studentNumber,
    this.fullName,
    this.schoolId,
    this.classId,
    this.relationship,
  });
  final String? id;
  final String? studentNumber;
  final String? fullName;
  final String? schoolId;
  final String? classId;
  final String? relationship;
}
