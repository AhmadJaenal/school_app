import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';

class MarkNotificationAsRead {
  MarkNotificationAsRead(this._repository);
  final NotificationRepository _repository;

  Future<void> call(int notificationId) =>
      _repository.markAsRead(notificationId);
}
