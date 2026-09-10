import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/data/models/auth_session_model.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/network/urls.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, AuthSessionModel>> login(params);
  Future<Either<Failure, bool>> register(params, String role);
  Future<void> forgotPassword();
  Future<void> resetPassword();
  Future<Either<Failure, bool>> logout();
}

class AuthRemoteDataSourceImpl extends RepositoryHelper
    implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, AuthSessionModel>> login(params) {
    var dioCall = dioClient.postRequest(URLs.login, data: params);

    return callApi<AuthSessionModel>(
      api: dioCall,
      jsonCallback: (json) => AuthSessionModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, bool>> register(dynamic params, String role) {
    final dioCall = dioClient.postRequest(
      '${URLs.register}/$role',
      data: params,
    );

    return callApiBool(api: dioCall);
  }

  @override
  Future<void> forgotPassword() async {
    await callApiBool(api: dioClient.postRequest(URLs.forgotPassword));
  }

  @override
  Future<void> resetPassword() async {
    await callApiBool(api: dioClient.postRequest(URLs.resetPassword));
  }

  @override
  Future<Either<Failure, bool>> logout() {
    var dioCall = dioClient.postRequest(URLs.logout);

    return callApiBool(api: dioCall);
  }
}
