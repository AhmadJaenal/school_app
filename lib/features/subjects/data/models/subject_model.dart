import 'package:school_app/features/subjects/domain/entities/subject.dart';

class SubjectModel extends SubjectEntity {
  const SubjectModel({
    super.id,
    super.schoolId,
    super.code,
    super.name,
    super.description,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      code: json['subject_code'] as String? ?? json['code'] as String?,
      name: json['subject_name'] as String? ?? json['name'] as String?,
      description: json['description'] as String?,
      schoolId: json['school_id']?.toString(),
      id: json['id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject_code': code,
      'subject_name': name,
      'description': description,
      'school_id': schoolId,
      'id': id,
    };
  }
}
