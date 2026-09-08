abstract class Failure {
  final String message;
  const Failure(this.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('Connection timeout');
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super('No internet connection');
}

class RequestCancelledFailure extends Failure {
  const RequestCancelledFailure() : super('Request cancelled');
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Unauthorized access');
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure() : super('Access forbidden');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super('Resource not found');
}

class ServerFailure extends Failure {
  const ServerFailure() : super('Internal server error');
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('An unknown error occurred');
}

class JoinClassroomPending extends Failure {
  const JoinClassroomPending()
    : super(
        'Pengajuan untuk bergabung ke kelas sudah berhasil di kirim, saat ini sedang menunggu permintaan Anda diterima!',
      );
}

class JoinClassroomDeclined extends Failure {
  const JoinClassroomDeclined() : super('Anda tidak bisa masuk ke kelas ini');
}

class AlreadyJoinedFailure extends Failure {
  const AlreadyJoinedFailure() : super('Anda sudah bergabung dengan kelas ini');
}

class ProcessingFailure extends Failure {
  const ProcessingFailure(super.message);
}
