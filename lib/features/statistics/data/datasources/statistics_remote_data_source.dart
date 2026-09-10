import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/network/urls.dart';

typedef StatisticsJson = Map<String, dynamic>;

abstract class StatisticsRemoteDataSource {
  Future<Either<Failure, StatisticsJson>> getStudentGrades(int studentId);
  Future<Either<Failure, StatisticsJson>> getStudentAttendance(int studentId);
  Future<Either<Failure, StatisticsJson>> getStudentReport(int studentId);
  Future<Either<Failure, StatisticsJson>> getClassGrades(int classId);
  Future<Either<Failure, StatisticsJson>> getClassAttendance(int classId);
  Future<Either<Failure, StatisticsJson>> getSchoolOverview();
}

class StatisticsRemoteDataSourceImpl extends RepositoryHelper
    implements StatisticsRemoteDataSource {
  Future<Either<Failure, StatisticsJson>> _get(String url) => callApi(
    api: dioClient.getRequest(url),
    jsonCallback: (json) => Map<String, dynamic>.from(json as Map),
  );

  @override
  Future<Either<Failure, StatisticsJson>> getStudentGrades(int studentId) =>
      _get(URLs.studentGrades(studentId));

  @override
  Future<Either<Failure, StatisticsJson>> getStudentAttendance(int studentId) =>
      _get(URLs.studentAttendance(studentId));

  @override
  Future<Either<Failure, StatisticsJson>> getStudentReport(int studentId) =>
      _get(URLs.studentReport(studentId));

  @override
  Future<Either<Failure, StatisticsJson>> getClassGrades(int classId) =>
      _get(URLs.classGrades(classId));

  @override
  Future<Either<Failure, StatisticsJson>> getClassAttendance(int classId) =>
      _get(URLs.classAttendance(classId));

  @override
  Future<Either<Failure, StatisticsJson>> getSchoolOverview() =>
      _get(URLs.schoolOverview);
}
