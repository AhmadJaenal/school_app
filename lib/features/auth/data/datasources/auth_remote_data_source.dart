import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/data/models/auth_session_model.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/network/urls.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, AuthSessionModel>> login(params);
  Future<void> register();
  Future<void> forgotPassword();
  Future<void> resetPassword();
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
  Future<void> register() {
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword() {
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword() {
    throw UnimplementedError();
  }
}
