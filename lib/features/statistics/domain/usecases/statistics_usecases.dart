import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/statistics/domain/repositories/statistics_repository.dart';
import 'package:school_app/features/statistics/data/models/statistics_models.dart';
import 'package:school_app/models/pagination_model.dart';

class GetStudentGrades {
  GetStudentGrades(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, PaginationResult<StudentGradeStatisticsModel>>> call(
    int studentId,
  ) => _repository.getStudentGrades(studentId);
}

class GetStudentAttendance {
  GetStudentAttendance(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, PaginationResult<StudentAttendanceSummaryModel>>> call(
    int studentId,
  ) => _repository.getStudentAttendance(studentId);
}

class GetStudentReport {
  GetStudentReport(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, StudentReportModel>> call(int studentId) =>
      _repository.getStudentReport(studentId);
}

class GetClassGrades {
  GetClassGrades(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, PaginationResult<ClassGradeStatisticsModel>>> call(
    int classId,
  ) => _repository.getClassGrades(classId);
}

class GetClassAttendance {
  GetClassAttendance(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, ClassAttendanceSummaryModel>> call(int classId) =>
      _repository.getClassAttendance(classId);
}

class GetSchoolOverview {
  GetSchoolOverview(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, SchoolOverviewModel>> call() =>
      _repository.getSchoolOverview();
}
