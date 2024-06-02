import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final int id;
  final String fullName;
  final String nisn;
  final String email;
  final String type;
  final int year;
  final String address;
  final String religion;
  final String classroom;

  const StudentEntity({
    required this.id,
    required this.fullName,
    required this.nisn,
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
      fullName,
      nisn,
      email,
      type,
      year,
      address,
      religion,
      classroom,
    ];
  }
}
