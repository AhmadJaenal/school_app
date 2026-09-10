import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';
import 'package:school_app/features/subjects/data/datasources/subject_remote_datasource.dart';
import 'package:school_app/features/subjects/domain/repositories/subject_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  SubjectRepositoryImpl(this._dataSource);
  final SubjectRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<SubjectModel>>> getSubjects() =>
      _dataSource.getSubjects();

  @override
  Future<Either<Failure, SubjectModel>> createSubject(dynamic params) =>
      _dataSource.postSubject(params);

  @override
  Future<Either<Failure, SubjectModel>> getSubjectDetail(int id) =>
      _dataSource.getDetailSubject(id);

  @override
  Future<Either<Failure, SubjectModel>> updateSubject(int id) =>
      _dataSource.updateSubject(id);

  @override
  Future<Either<Failure, bool>> deleteSubject(int id) =>
      _dataSource.deleteSubject(id);

  @override
  Future<Either<Failure, bool>> assignTeacherToSubject(int subjectId) =>
      _dataSource.assignTeacherToSubject(subjectId);
}
