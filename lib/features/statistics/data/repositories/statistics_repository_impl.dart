import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/statistics/data/datasources/statistics_remote_data_source.dart';
import 'package:school_app/features/statistics/domain/entities/statistics_entities.dart';
import 'package:school_app/features/statistics/domain/repositories/statistics_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  StatisticsRepositoryImpl(this._dataSource);
  final StatisticsRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<StudentGradeStatisticsEntity>>>
  getStudentGrades(int studentId) => _dataSource.getStudentGrades(studentId);

  @override
  Future<Either<Failure, PaginationResult<StudentAttendanceSummaryEntity>>>
  getStudentAttendance(int studentId) =>
      _dataSource.getStudentAttendance(studentId);

  @override
  Future<Either<Failure, StudentReportEntity>> getStudentReport(
    int studentId,
  ) => _dataSource.getStudentReport(studentId);

  @override
  Future<Either<Failure, PaginationResult<ClassGradeStatisticsEntity>>>
  getClassGrades(int classId) => _dataSource.getClassGrades(classId);

  @override
  Future<Either<Failure, ClassAttendanceSummaryEntity>> getClassAttendance(
    int classId,
  ) => _dataSource.getClassAttendance(classId);

  @override
  Future<Either<Failure, SchoolOverviewEntity>> getSchoolOverview() =>
      _dataSource.getSchoolOverview();
}
