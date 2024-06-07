import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_dart_event.dart';
part 'notification_dart_state.dart';

class NotificationDartBloc extends Bloc<NotificationDartEvent, NotificationDartState> {
  NotificationDartBloc() : super(NotificationDartInitial()) {
    on<NotificationDartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
