import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/entities/auth_session.dart';
import 'package:school_app/features/auth/domain/usecases/login.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Authenticated extends AuthState {
  const Authenticated(this.session);
  final AuthSession session;
}

class AuthFailure extends AuthState {
  const AuthFailure(this.failure);
  final Failure failure;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._login) : super(const AuthInitial());

  final Login _login;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(const AuthLoading());
    final result = await _login.execute({
      'username': username,
      'password': password,
    });
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (session) => emit(Authenticated(session)),
    );
  }
}
