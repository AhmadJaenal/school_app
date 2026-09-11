import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/helpers/bloc_helper.dart';

abstract class BaseCubit<T> extends Cubit<DataState<T>> {
  BaseCubit() : super(const DataState.initial());

  Future<void> fetchData(Future<Either<Failure, T>> Function() request) async {
    emit(const DataState.loading());

    final result = await request();

    result.fold(
      (failure) => emit(DataState.error(failure.message)),
      (data) => emit(DataState.success(data)),
    );
  }
}
