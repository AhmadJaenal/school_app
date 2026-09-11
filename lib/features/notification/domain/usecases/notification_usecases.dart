import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/notification/domain/entities/notification.dart';
import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class GetNotifications {
  GetNotifications(this._repository);

  final NotificationRepository _repository;

  Future<Either<Failure, PaginationResult<NotificationEntity>>> call() =>
      _repository.getNotifications();
}

class GetUnreadNotifications {
  GetUnreadNotifications(this._repository);

  final NotificationRepository _repository;
  Future<Either<Failure, int>> call() => _repository.getUnreadCount();
}

class MarkAsReadNotifiation {
  MarkAsReadNotifiation(this._repository);

  final NotificationRepository _repository;

  Future<Either<Failure, bool>> call(int notificationId) =>
      _repository.markAsRead(notificationId);
}
