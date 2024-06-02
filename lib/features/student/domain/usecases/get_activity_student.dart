import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/activity.dart';
import '../repositories/student_repository.dart';

class GetActivityStudent {
  final StudentRepository studentRepository;

  const GetActivityStudent(this.studentRepository);

  Future<Either<Failure, List<ActivityStudentEntity>>> execute() async {
    return await studentRepository.getActivityStudent();
  }
}
