import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/statistics/domain/entities/statistics_entities.dart';
import 'package:school_app/features/statistics/domain/repositories/statistics_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class GetStudentGrades {
  GetStudentGrades(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, PaginationResult<StudentGradeStatisticsEntity>>> call(
    int studentId,
  ) => _repository.getStudentGrades(studentId);
}

class GetStudentAttendance {
  GetStudentAttendance(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, PaginationResult<StudentAttendanceSummaryEntity>>>
  call(int studentId) => _repository.getStudentAttendance(studentId);
}

class GetStudentReport {
  GetStudentReport(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, StudentReportEntity>> call(int studentId) =>
      _repository.getStudentReport(studentId);
}

class GetClassGrades {
  GetClassGrades(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, PaginationResult<ClassGradeStatisticsEntity>>> call(
    int classId,
  ) => _repository.getClassGrades(classId);
}

class GetClassAttendance {
  GetClassAttendance(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, ClassAttendanceSummaryEntity>> call(int classId) =>
      _repository.getClassAttendance(classId);
}

class GetSchoolOverview {
  GetSchoolOverview(this._repository);
  final StatisticsRepository _repository;
  Future<Either<Failure, SchoolOverviewEntity>> call() =>
      _repository.getSchoolOverview();
}
