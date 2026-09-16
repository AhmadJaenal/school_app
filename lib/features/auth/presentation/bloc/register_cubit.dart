import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/usecases/register.dart';

sealed class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess();
}

class RegisterFailure extends RegisterState {
  const RegisterFailure(this.failure);
  final Failure failure;
}

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._register) : super(const RegisterInitial());

  final Register _register;

  Future<void> submit({
    required Map<String, dynamic> data,
    required String role,
  }) async {
    emit(const RegisterLoading());
    final result = await _register.execute(data, role);
    result.fold(
      (failure) => emit(RegisterFailure(failure)),
      (_) => emit(const RegisterSuccess()),
    );
  }
}
