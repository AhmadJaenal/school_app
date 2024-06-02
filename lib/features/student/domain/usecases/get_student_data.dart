import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/student.dart';
import '../repositories/student_repository.dart';

class GetStudentData {
  final StudentRepository studentRepository;

  const GetStudentData(this.studentRepository);

  Future<Either<Failure, StudentEntity>> execute(int id) async {
    return await studentRepository.getStudentData(id);
  }
}
