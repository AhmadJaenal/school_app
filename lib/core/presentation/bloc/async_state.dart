enum AsyncStatus { initial, loading, success, failure }

class AsyncState<T> {
  const AsyncState({
    this.status = AsyncStatus.initial,
    this.data,
    this.message,
  });

  final AsyncStatus status;
  final T? data;
  final String? message;

  AsyncState<T> copyWith({AsyncStatus? status, T? data, String? message}) =>
      AsyncState<T>(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message,
      );
}
