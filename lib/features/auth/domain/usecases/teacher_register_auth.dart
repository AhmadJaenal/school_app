import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/student_entity_auth.dart';
import '../repositories/teacher_repo_auth.dart';

class TeacherRegister {
  final TeacherRepoAuth teacherRepoAuth;

  const TeacherRegister(this.teacherRepoAuth);

  Future<Either<Failure, StudentEntityAuth>> execute() async {
    return await teacherRepoAuth.register();
  }
}
