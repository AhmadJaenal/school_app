import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/student_entity_auth.dart';
import '../repositories/student_repo_auth.dart';

class StudentResetPass {
  final StudentRepoAuth studentRepoAuth;

  const StudentResetPass(this.studentRepoAuth);

  Future<Either<Failure, StudentEntityAuth>> execute() async {
    return await studentRepoAuth.resetPassword();
  }
}
