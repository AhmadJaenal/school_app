import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/classes/data/models/class_detail_model.dart';
import 'package:school_app/features/classes/data/models/class_model.dart';
import 'package:school_app/features/classes/data/models/response_create_class.dart';
import 'package:school_app/features/classes/data/models/student_model.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

abstract class ClassesRemoteDataSource {
  Future<Either<Failure, PaginationResult<ClassModel>>> getClass();
  Future<Either<Failure, ResponseCreateClass>> postClass(params);
  Future<Either<Failure, DetailClassModel>> getDetailClass(int id);
  Future<Either<Failure, ResponseCreateClass>> updateClass(int id);
  Future<Either<Failure, bool>> deleteClass(int id);
  Future<Either<Failure, PaginationResult<StudentModel>>> getStudentsInClass(
    int id,
  );
  Future<Either<Failure, void>> addStudentToClass(int id);
  Future<Either<Failure, StudentModel>> moveStudentToClass(int studentId);
  Future<Either<Failure, StudentModel>> deleteStudentInClass(int studentId);
}

class ClassesRemoteDataSourceImpl extends RepositoryHelper
    implements ClassesRemoteDataSource {
  @override
  Future<Either<Failure, void>> addStudentToClass(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteClass(int id) {
    var dioCall = dioClient.getRequest("${URLs.classes}/$id");

    return callApiBool(api: dioCall);
  }

  @override
  Future<Either<Failure, StudentModel>> deleteStudentInClass(int studentId) {
    final dioCall = dioClient.deleteRequest(
      "${URLs.classes}/students/$studentId",
    );

    return callApi(
      api: dioCall,
      jsonCallback: (json) => StudentModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, PaginationResult<ClassModel>>> getClass() {
    var dioCall = dioClient.getRequest(URLs.classes);

    return callApiWithPaginationData(
      api: dioCall,
      jsonCallback: (json) => ClassModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, DetailClassModel>> getDetailClass(int id) {
    var dioCall = dioClient.getRequest("${URLs.classes}/$id");

    return callApi(
      api: dioCall,
      jsonCallback: (json) => DetailClassModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, PaginationResult<StudentModel>>> getStudentsInClass(
    int id,
  ) {
    var dioCall = dioClient.getRequest("${URLs.classes}/$id/students");

    return callApiWithPaginationData(
      api: dioCall,
      jsonCallback: (json) => StudentModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, StudentModel>> moveStudentToClass(int studentId) {
    var dioCall = dioClient.postRequest(
      "${URLs.classes}/students/$studentId/move",
    );
    return callApi(
      api: dioCall,
      jsonCallback: (json) => StudentModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, ResponseCreateClass>> postClass(params) {
    var dioCall = dioClient.postRequest(URLs.classes, data: params);
    return callApi(
      api: dioCall,
      jsonCallback: (json) => ResponseCreateClass.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, ResponseCreateClass>> updateClass(int id) {
    var dioCall = dioClient.putRequest("${URLs.classes}/$id");

    return callApi(
      api: dioCall,
      jsonCallback: (json) => ResponseCreateClass.fromJson(json),
    );
  }
}
