import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/student_entity_auth.dart';
import '../repositories/teacher_repo_auth.dart';

class TeacherLogin {
  final TeacherRepoAuth teacherRepoAuth;

  const TeacherLogin(this.teacherRepoAuth);

  Future<Either<Failure, StudentEntityAuth>> execute() async {
    return await teacherRepoAuth.login();
  }
}
