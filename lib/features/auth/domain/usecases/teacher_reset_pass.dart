import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/student_entity_auth.dart';
import '../repositories/teacher_repo_auth.dart';

class TeacherResetPass {
  final TeacherRepoAuth teacherRepoAuth;

  const TeacherResetPass(this.teacherRepoAuth);

  Future<Either<Failure, StudentEntityAuth>> execute() async {
    return await teacherRepoAuth.resetPassword();
  }
}
