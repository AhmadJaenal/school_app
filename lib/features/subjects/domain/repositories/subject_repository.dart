import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class SubjectRepository {
  Future<Either<Failure, PaginationResult<SubjectModel>>> getSubjects();
  Future<Either<Failure, SubjectModel>> createSubject(dynamic params);
  Future<Either<Failure, SubjectModel>> getSubjectDetail(int id);
  Future<Either<Failure, SubjectModel>> updateSubject(int id);
  Future<Either<Failure, bool>> deleteSubject(int id);
  Future<Either<Failure, bool>> assignTeacherToSubject(int subjectId);
}
