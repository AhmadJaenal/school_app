import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/statistics/domain/entities/statistics_entities.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class StatisticsRepository {
  Future<Either<Failure, PaginationResult<StudentGradeStatisticsEntity>>>
  getStudentGrades(int studentId);

  Future<Either<Failure, PaginationResult<StudentAttendanceSummaryEntity>>>
  getStudentAttendance(int studentId);

  Future<Either<Failure, StudentReportEntity>> getStudentReport(int studentId);

  Future<Either<Failure, PaginationResult<ClassGradeStatisticsEntity>>>
  getClassGrades(int classId);

  Future<Either<Failure, ClassAttendanceSummaryEntity>> getClassAttendance(
    int classId,
  );

  Future<Either<Failure, SchoolOverviewEntity>> getSchoolOverview();
}
