import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/subjects/data/datasources/subject_remote_datasource.dart';
import 'package:school_app/features/subjects/domain/entities/subject.dart';
import 'package:school_app/features/subjects/domain/repositories/subject_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  SubjectRepositoryImpl(this._dataSource);
  final SubjectRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<SubjectEntity>>> getSubjects() =>
      _dataSource.getSubjects();

  @override
  Future<Either<Failure, SubjectEntity>> createSubject(dynamic params) =>
      _dataSource.postSubject(params);

  @override
  Future<Either<Failure, SubjectEntity>> getSubjectDetail(int id) =>
      _dataSource.getDetailSubject(id);

  @override
  Future<Either<Failure, SubjectEntity>> updateSubject(int id) =>
      _dataSource.updateSubject(id);

  @override
  Future<Either<Failure, bool>> deleteSubject(int id) =>
      _dataSource.deleteSubject(id);

  @override
  Future<Either<Failure, bool>> assignTeacherToSubject(int subjectId) =>
      _dataSource.assignTeacherToSubject(subjectId);
}
