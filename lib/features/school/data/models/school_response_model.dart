class SchoolResponseModel {
  const SchoolResponseModel({
    this.id,
    this.groupId,
    this.schoolName,
    this.npsn,
    this.educationLevel,
    this.address,
    this.phoneNumber,
    this.email,
    this.logoUrl,
    this.isActive,
    this.classesCount,
    this.teachersCount,
    this.studentsCount,
  });

  final String? id;
  final int? groupId;
  final String? schoolName;
  final String? npsn;
  final String? educationLevel;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? logoUrl;
  final bool? isActive;
  final int? classesCount;
  final int? teachersCount;
  final int? studentsCount;

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
}
