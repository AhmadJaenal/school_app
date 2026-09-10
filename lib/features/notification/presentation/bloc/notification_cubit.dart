import 'package:school_app/core/presentation/bloc/app_cubit.dart';
import 'package:school_app/features/notification/domain/usecases/get_notifications.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';

class NotificationCubit extends AppCubit<List<NotificationModel>> {
  NotificationCubit(this._getNotifications);

  final GetNotifications _getNotifications;

  Future<void> load() => run(_getNotifications.call);
}
