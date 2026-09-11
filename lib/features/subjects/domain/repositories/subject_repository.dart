import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/subjects/domain/entities/subject.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class SubjectRepository {
  Future<Either<Failure, PaginationResult<SubjectEntity>>> getSubjects();
  Future<Either<Failure, SubjectEntity>> createSubject(dynamic params);
  Future<Either<Failure, SubjectEntity>> getSubjectDetail(int id);
  Future<Either<Failure, SubjectEntity>> updateSubject(int id);
  Future<Either<Failure, bool>> deleteSubject(int id);
  Future<Either<Failure, bool>> assignTeacherToSubject(int subjectId);
}
