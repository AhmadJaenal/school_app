import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';

class GetUnreadNotificationCount {
  GetUnreadNotificationCount(this._repository);
  final NotificationRepository _repository;

  Future<int> call() => _repository.getUnreadCount();
}
