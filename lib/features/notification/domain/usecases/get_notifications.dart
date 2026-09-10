import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';

class GetNotifications {
  GetNotifications(this._repository);

  final NotificationRepository _repository;

  Future<List<NotificationModel>> call() => _repository.getNotifications();
}
