import 'package:school_app/features/school/domain/entities/school.dart';

class SchoolResponseModel extends SchoolEntity {
  const SchoolResponseModel({
    super.id,
    super.groupId,
    super.schoolName,
    super.npsn,
    super.educationLevel,
    super.address,
    super.phoneNumber,
    super.email,
    super.logoUrl,
    super.isActive,
    super.classesCount,
    super.teachersCount,
    super.studentsCount,
  });

  factory SchoolResponseModel.fromJson(Map<String, dynamic> json) =>
      SchoolResponseModel(
        id: json['id']?.toString(),
        groupId: (json['group_id'] as num?)?.toInt(),
        schoolName: json['school_name'] as String?,
        npsn: json['npsn'] as String?,
        educationLevel: json['education_level'] as String?,
        address: json['address'] as String?,
        phoneNumber: json['phone_number'] as String?,
        email: json['email'] as String?,
        logoUrl: json['logo_url'] as String?,
        isActive: json['is_active'] as bool?,
        classesCount: (json['classes_count'] as num?)?.toInt(),
        teachersCount: (json['teachers_count'] as num?)?.toInt(),
        studentsCount: (json['students_count'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'group_id': groupId,
    'school_name': schoolName,
    'npsn': npsn,
    'education_level': educationLevel,
    'address': address,
    'phone_number': phoneNumber,
    'email': email,
    'logo_url': logoUrl,
    'is_active': isActive,
    'classes_count': classesCount,
    'teachers_count': teachersCount,
    'students_count': studentsCount,
  };
}
