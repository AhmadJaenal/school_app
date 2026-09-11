import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/notification/domain/entities/notification.dart';
import 'package:school_app/models/pagination_model.dart';

abstract interface class NotificationRepository {
  Future<Either<Failure, PaginationResult<NotificationEntity>>>
  getNotifications();
  Future<Either<Failure, int>> getUnreadCount();
  Future<Either<Failure, bool>> markAsRead(int id);
}
