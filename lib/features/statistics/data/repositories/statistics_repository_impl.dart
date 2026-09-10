import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/statistics/data/datasources/statistics_remote_data_source.dart';
import 'package:school_app/features/statistics/domain/repositories/statistics_repository.dart';
import 'package:school_app/features/statistics/data/models/statistics_models.dart';
import 'package:school_app/models/pagination_model.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  StatisticsRepositoryImpl(this._dataSource);
  final StatisticsRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PaginationResult<StudentGradeStatisticsModel>>>
  getStudentGrades(int studentId) => _dataSource.getStudentGrades(studentId);
  @override
  Future<Either<Failure, PaginationResult<StudentAttendanceSummaryModel>>>
  getStudentAttendance(int studentId) =>
      _dataSource.getStudentAttendance(studentId);
  @override
  Future<Either<Failure, StudentReportModel>> getStudentReport(int studentId) =>
      _dataSource.getStudentReport(studentId);
  @override
  Future<Either<Failure, PaginationResult<ClassGradeStatisticsModel>>>
  getClassGrades(int classId) => _dataSource.getClassGrades(classId);
  @override
  Future<Either<Failure, ClassAttendanceSummaryModel>> getClassAttendance(
    int classId,
  ) => _dataSource.getClassAttendance(classId);
  @override
  Future<Either<Failure, SchoolOverviewModel>> getSchoolOverview() =>
      _dataSource.getSchoolOverview();
}
