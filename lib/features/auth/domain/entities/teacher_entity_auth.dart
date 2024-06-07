import 'package:equatable/equatable.dart';

class TeacherEntityAuth extends Equatable {
  final int id;
  final String nip;
  final String fullName;
  final String email;
  final String address;
  final String religion;
  final int phoneNumber;

  const TeacherEntityAuth({
    required this.id,
    required this.nip,
    required this.fullName,
    required this.email,
    required this.address,
    required this.religion,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props {
    return [
      id,
      nip,
      fullName,
      email,
      address,
      religion,
      phoneNumber,
    ];
  }
}
