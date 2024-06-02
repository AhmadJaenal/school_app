import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final int id;
  final String nisn;
  final String fullName;
  final String email;
  final String type;
  final int year;
  final String address;
  final String religion;
  final String classroom;

  const StudentEntity({
    required this.id,
    required this.nisn,
    required this.fullName,
    required this.email,
    required this.type,
    required this.year,
    required this.address,
    required this.religion,
    required this.classroom,
  });

  @override
  List<Object?> get props {
    return [
      id,
      nisn,
      fullName,
      email,
      type,
      year,
      address,
      religion,
      classroom,
    ];
  }
}
