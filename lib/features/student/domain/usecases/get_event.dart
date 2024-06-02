import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/event.dart';
import '../repositories/student_repository.dart';

class GetEvent {
  final StudentRepository studentRepository;

  const GetEvent(this.studentRepository);

  Future<Either<Failure, List<EventEntity>>> execute() async {
    return await studentRepository.getEvent();
  }
}
