import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  const SubjectEntity({
    this.id,
    this.schoolId,
    this.code,
    this.name,
    this.description,
  });

  final String? id;
  final String? schoolId;
  final String? code;
  final String? name;
  final String? description;

  @override
  List<Object?> get props => [id, schoolId, code, name, description];
}
