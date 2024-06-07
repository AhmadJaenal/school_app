import 'package:dartz/dartz.dart';
import '../entities/student_entity_auth.dart';
import '../repositories/student_repo_auth.dart';

import '../../../../core/error/failure.dart';

class StudentRegister {
  final StudentRepoAuth studentRepoAuth;

  const StudentRegister(this.studentRepoAuth);

  Future<Either<Failure, StudentEntityAuth>> execute() async {
    return await studentRepoAuth.register();
  }
}
