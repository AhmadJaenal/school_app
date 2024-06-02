import '../../domain/entities/student.dart';

class StudentModel extends StudentEntity {
  const StudentModel({
    required super.id,
    required super.nisn,
    required super.fullName,
    required super.email,
    required super.type,
    required super.year,
    required super.address,
    required super.religion,
    required super.classroom,
  }) : super();

  factory StudentModel.fromjson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      nisn: json['nisn'],
      fullName: json['full_name'],
      email: json['email'],
      type: json['type'],
      year: json['year'],
      address: json['address'],
      religion: json['religion'],
      classroom: json['classroom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nisn": nisn,
      "full_name": fullName,
      "email": email,
      "type": type,
      "year": year,
      "address": address,
      "religion": religion,
      "classroom": classroom,
    };
  }
}
