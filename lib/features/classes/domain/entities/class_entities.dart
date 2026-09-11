import 'package:equatable/equatable.dart';
import 'package:school_app/features/classes/domain/entities/student_entities.dart';
import 'package:school_app/features/classes/domain/entities/teacher_entities.dart';
import 'package:school_app/features/classes/domain/entities/year_academic_entities.dart';

class ClassEntity extends Equatable {
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

  @override
  List<Object?> get props => [id, schoolId, name, code, capacity];
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

  @override
  List<Object?> get props => [
    ...super.props,
    academicYearId,
    gradeLevel,
    homeroomTeacherId,
    academicYear,
    homeroomTeacher,
    students,
  ];
}
