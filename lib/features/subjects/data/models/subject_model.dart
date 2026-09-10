import 'package:equatable/equatable.dart';

class SubjectModel extends Equatable {
  final String subjectCode;
  final String subjectName;
  final String description;
  final String schoolId;
  final String id;

  const SubjectModel({
    required this.subjectCode,
    required this.subjectName,
    required this.description,
    required this.schoolId,
    required this.id,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectCode: json['subject_code'] as String,
      subjectName: json['subject_name'] as String,
      description: json['description'] as String,
      schoolId: json['school_id'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject_code': subjectCode,
      'subject_name': subjectName,
      'description': description,
      'school_id': schoolId,
      'id': id,
    };
  }

  @override
  List<Object?> get props => [
    subjectCode,
    subjectName,
    description,
    schoolId,
    id,
  ];
}
