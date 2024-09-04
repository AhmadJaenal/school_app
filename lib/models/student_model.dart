class StudentModel {
  final int id;
  final int schoolId;
  final int classId;
  final int nisn;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String className;
  final String address;
  final String religion;
  final String password;
  final String token;
  final String createdAt;
  final String updatedAt;

  StudentModel({
    required this.id,
    required this.schoolId,
    required this.classId,
    required this.nisn,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.className,
    required this.address,
    required this.religion,
    required this.password,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      schoolId: json['school_id'],
      classId: json['class_id'],
      nisn: json['nisn'],
      fullName: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      className: json['class_name'],
      address: json['address'],
      religion: json['religion'],
      password: json['password'],
      token: json['token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  static List<StudentModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => StudentModel.fromJson(json)).toList();
  }
}
