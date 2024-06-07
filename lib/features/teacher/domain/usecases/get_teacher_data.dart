import 'package:dartz/dartz.dart';
import 'package:school_app/features/teacher/domain/entities/teacher_entity.dart';
import 'package:school_app/features/teacher/domain/repositories/teacher_repository.dart';

import '../../../../core/error/failure.dart';

class GetTeacherData {
  final TeacherRepository teacherRepository;

  const GetTeacherData(this.teacherRepository);

  Future<Either<Failure, TeacherEntity>> execute(int id) async {
    return await teacherRepository.getTeacherData(id);
  }
}
