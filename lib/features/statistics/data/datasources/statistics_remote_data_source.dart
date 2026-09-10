import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/features/statistics/data/models/statistics_models.dart';
import 'package:school_app/network/urls.dart';
import 'package:school_app/models/pagination_model.dart';

abstract class StatisticsRemoteDataSource {
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

class StatisticsRemoteDataSourceImpl extends RepositoryHelper
    implements StatisticsRemoteDataSource {
  Future<Either<Failure, T>> _get<T>(
    String url,
    T Function(dynamic json) fromJson,
  ) => callApi(api: dioClient.getRequest(url), jsonCallback: fromJson);

  @override
  Future<Either<Failure, PaginationResult<StudentGradeStatisticsModel>>>
  getStudentGrades(int studentId) => callApiWithPaginationData(
    api: dioClient.getRequest(URLs.studentGrades(studentId)),
    jsonCallback: (json) => StudentGradeStatisticsModel.fromJson(json),
  );

  @override
  Future<Either<Failure, PaginationResult<StudentAttendanceSummaryModel>>>
  getStudentAttendance(int studentId) => callApiWithPaginationData(
    api: dioClient.getRequest(URLs.studentAttendance(studentId)),
    jsonCallback: (json) => StudentAttendanceSummaryModel.fromJson(json),
  );

  @override
  Future<Either<Failure, StudentReportModel>> getStudentReport(int studentId) =>
      _get(
        URLs.studentReport(studentId),
        (json) =>
            StudentReportModel.fromJson(Map<String, dynamic>.from(json as Map)),
      );

  @override
  Future<Either<Failure, PaginationResult<ClassGradeStatisticsModel>>>
  getClassGrades(int classId) => callApiWithPaginationData(
    api: dioClient.getRequest(URLs.classGrades(classId)),
    jsonCallback: (json) => ClassGradeStatisticsModel.fromJson(json),
  );

  @override
  Future<Either<Failure, ClassAttendanceSummaryModel>> getClassAttendance(
    int classId,
  ) =>
      _get(URLs.classAttendance(classId), ClassAttendanceSummaryModel.fromJson);

  @override
  Future<Either<Failure, SchoolOverviewModel>> getSchoolOverview() => _get(
    URLs.schoolOverview,
    (json) =>
        SchoolOverviewModel.fromJson(Map<String, dynamic>.from(json as Map)),
  );
}
