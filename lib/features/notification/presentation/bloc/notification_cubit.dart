import 'package:school_app/features/notification/domain/entities/notification.dart';
import 'package:school_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:school_app/helpers/base_cubit.dart';
import 'package:school_app/models/pagination_model.dart';

class NotificationCubit
    extends BaseCubit<PaginationResult<NotificationEntity>> {
  final NotificationRepository _repository;
  NotificationCubit(this._repository);

  void load() => fetchData(() => _repository.getNotifications());
}
