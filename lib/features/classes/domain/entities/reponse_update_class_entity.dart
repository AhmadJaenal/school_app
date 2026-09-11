import 'package:equatable/equatable.dart';

class ResponseUpdateClassEntity extends Equatable {
  const ResponseUpdateClassEntity({
    this.id,
    this.schoolId,
    this.academicYearId,
    this.className,
    this.gradeLevel,
    this.homeroomTeacherId,
    this.capacity,
  });

  final String? id;
  final String? schoolId;
  final String? academicYearId;
  final String? className;
  final String? gradeLevel;
  final String? homeroomTeacherId;
  final int? capacity;

  @override
  List<Object?> get props => [
    id,
    schoolId,
    academicYearId,
    className,
    gradeLevel,
    homeroomTeacherId,
    capacity,
  ];
}
