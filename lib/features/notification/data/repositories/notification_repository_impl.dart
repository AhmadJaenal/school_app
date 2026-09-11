import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:school_app/features/notification/domain/entities/notification.dart';
import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:school_app/models/pagination_model.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._remoteDataSource);

  final NotificationRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, PaginationResult<NotificationEntity>>>
  getNotifications() async {
    final result = await _remoteDataSource.getNotifications();
    return result.fold((failure) => Left(failure), (page) => Right(page));
  }

  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    final result = await _remoteDataSource.getUnreadCount();
    return result.fold((failure) => Left(failure), (count) => Right(count));
  }

  @override
  Future<Either<Failure, bool>> markAsRead(int id) async {
    final result = await _remoteDataSource.markAsRead(id);
    return result.fold((failure) => Left(failure), (success) => Right(success));
  }
}
