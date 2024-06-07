import 'package:dartz/dartz.dart';
import '../entities/teacher_entity.dart';
import '../repositories/teacher_repository.dart';

import '../../../../core/error/failure.dart';

class GetHistoryTransaction {
  final TeacherRepository teacherRepository;

  const GetHistoryTransaction(this.teacherRepository);

  Future<Either<Failure, List<TeacherEntity>>> execute() async {
    return await teacherRepository.getHistoryTransaction();
  }
}
