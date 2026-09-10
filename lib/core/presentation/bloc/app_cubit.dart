import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'async_state.dart';

abstract class AppCubit<T> extends Cubit<AsyncState<T>> {
  AppCubit() : super(AsyncState<T>());

  Future<void> run(Future<T> Function() action) async {
    emit(AsyncState<T>(status: AsyncStatus.loading));
    try {
      final value = await action();
      emit(AsyncState<T>(status: AsyncStatus.success, data: value));
    } catch (error) {
      emit(
        AsyncState<T>(
          status: AsyncStatus.failure,
          message: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  Future<void> runEither(Future<Either<Failure, T>> Function() action) async {
    emit(AsyncState<T>(status: AsyncStatus.loading));
    final result = await action();
    result.fold(
      (failure) => emit(
        AsyncState<T>(status: AsyncStatus.failure, message: failure.message),
      ),
      (value) => emit(AsyncState<T>(status: AsyncStatus.success, data: value)),
    );
  }
}
