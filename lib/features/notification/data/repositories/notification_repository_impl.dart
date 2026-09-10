import 'package:school_app/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._remoteDataSource);

  final NotificationRemoteDataSource _remoteDataSource;

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final result = await _remoteDataSource.getNotifications();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (page) => page.data,
    );
  }

  @override
  Future<int> getUnreadCount() async {
    final result = await _remoteDataSource.getUnreadCount();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (count) => count,
    );
  }

  @override
  Future<void> markAsRead(int id) async {
    final result = await _remoteDataSource.markAsRead(id);
    result.fold((failure) => throw Exception(failure.message), (_) {});
  }
}
