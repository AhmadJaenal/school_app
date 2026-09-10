import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:school_app/features/auth/domain/entities/auth_session.dart';
import 'package:school_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:school_app/session/session_key.dart';
import 'package:school_app/session/session_manager.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource, this._sessionManager);

  final AuthRemoteDataSource _remoteDataSource;
  final SessionManager _sessionManager;

  @override
  Future<Either<Failure, void>> forgotPassword() async {
    await _remoteDataSource.forgotPassword();
    return right(null);
  }

  @override
  Future<Either<Failure, AuthSession>> login(dynamic params) async {
    final result = await _remoteDataSource.login(params);
    return result.fold((failure) async => left(failure), (session) async {
      await _sessionManager.write(SessionKey.token, session.accessToken);
      if (session.user != null) {
        await _sessionManager.write(SessionKey.id, session.user!.id.toString());
        await _sessionManager.write(
          SessionKey.fullname,
          session.user!.username,
        );
      }
      return right(session);
    });
  }

  @override
  Future<Either<Failure, void>> register(dynamic params, String role) async {
    final result = await _remoteDataSource.register(params, role);
    return result.fold((failure) => left(failure), (_) => right(null));
  }

  @override
  Future<Either<Failure, void>> resetPassword() async {
    await _remoteDataSource.resetPassword();
    return right(null);
  }
}
