import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/notification/data/models/notification_model.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

abstract class NotificationRemoteDataSource {
  Future<Either<Failure, PaginationResult<NotificationModel>>>
  getNotifications();
  Future<Either<Failure, int>> getUnreadCount();
  Future<Either<Failure, bool>> markAsRead(int id);
}

class NotificationRemoteDataSourceImpl extends RepositoryHelper
    implements NotificationRemoteDataSource {
  @override
  Future<Either<Failure, PaginationResult<NotificationModel>>>
  getNotifications() => callApiWithPaginationData(
    api: dioClient.getRequest(URLs.notifications),
    jsonCallback: (json) => NotificationModel.fromJson(json),
  );

  @override
  Future<Either<Failure, int>> getUnreadCount() => callApi(
    api: dioClient.getRequest(URLs.unreadNotificationCount),
    jsonCallback: (json) => (json as num).toInt(),
  );

  @override
  Future<Either<Failure, bool>> markAsRead(int id) =>
      callApiBool(api: dioClient.postRequest(URLs.markNotificationRead(id)));
}
