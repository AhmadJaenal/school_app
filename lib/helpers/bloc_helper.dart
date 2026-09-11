import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_helper.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const factory DataState.initial() = Initial<T>;
  const factory DataState.loading() = Loading<T>;
  const factory DataState.success(T data) = Success<T>;
  const factory DataState.error(String message) = Error<T>;
}
