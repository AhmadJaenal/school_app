import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/student_entity_auth.dart';

abstract class TeacherRepoAuth {
  Future<Either<Failure, StudentEntityAuth>> register();
  Future login();
  Future resetPassword();
}
