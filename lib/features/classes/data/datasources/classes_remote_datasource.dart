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
  Future<Either<Failure, void>> addStudentToClass(int classId, dynamic params);
  Future<Either<Failure, StudentModel>> moveStudentToClass(
    int classId,
    int studentId,
  );
  Future<Either<Failure, StudentModel>> deleteStudentInClass(
    int classId,
    int studentId,
  );
}

class ClassesRemoteDataSourceImpl extends RepositoryHelper
    implements ClassesRemoteDataSource {
  @override
  Future<Either<Failure, void>> addStudentToClass(int classId, dynamic params) {
    final dioCall = dioClient.postRequest(
      URLs.studentsInClass(classId),
      data: params,
    );
    return callApi<void>(api: dioCall);
  }

  @override
  Future<Either<Failure, bool>> deleteClass(int id) {
    final dioCall = dioClient.deleteRequest(URLs.detailClass(id), data: null);

    return callApiBool(api: dioCall);
  }

  @override
  Future<Either<Failure, StudentModel>> deleteStudentInClass(
    int classId,
    int studentId,
  ) {
    final dioCall = dioClient.deleteRequest(
      URLs.removeStudentFromClass(classId: classId, studentId: studentId),
      data: null,
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
    final dioCall = dioClient.getRequest(URLs.detailClass(id));

    return callApi(
      api: dioCall,
      jsonCallback: (json) => DetailClassModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, PaginationResult<StudentModel>>> getStudentsInClass(
    int id,
  ) {
    final dioCall = dioClient.getRequest(URLs.studentsInClass(id));

    return callApiWithPaginationData(
      api: dioCall,
      jsonCallback: (json) => StudentModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, StudentModel>> moveStudentToClass(
    int classId,
    int studentId,
  ) {
    final dioCall = dioClient.postRequest(
      URLs.moveStudentToClass(classId: classId, studentId: studentId),
    );
    return callApi(
      api: dioCall,
      jsonCallback: (json) => StudentModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, ResponseCreateClass>> postClass(params) {
    final dioCall = dioClient.postRequest(URLs.classes, data: params);
    return callApi(
      api: dioCall,
      jsonCallback: (json) => ResponseCreateClass.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, ResponseCreateClass>> updateClass(int id) {
    final dioCall = dioClient.putRequest(URLs.detailClass(id));

    return callApi(
      api: dioCall,
      jsonCallback: (json) => ResponseCreateClass.fromJson(json),
    );
  }
}
