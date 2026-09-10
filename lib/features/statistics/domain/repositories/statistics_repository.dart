import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/statistics/data/models/statistics_models.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class StatisticsRepository {
  Future<Either<Failure, PaginationResult<StudentGradeStatisticsModel>>>
  getStudentGrades(int studentId);
  Future<Either<Failure, PaginationResult<StudentAttendanceSummaryModel>>>
  getStudentAttendance(int studentId);
  Future<Either<Failure, StudentReportModel>> getStudentReport(int studentId);
  Future<Either<Failure, PaginationResult<ClassGradeStatisticsModel>>>
  getClassGrades(int classId);
  Future<Either<Failure, ClassAttendanceSummaryModel>> getClassAttendance(
    int classId,
  );
  Future<Either<Failure, SchoolOverviewModel>> getSchoolOverview();
}
