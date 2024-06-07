part of 'notification_dart_bloc.dart';

abstract class NotificationDartState extends Equatable {
  const NotificationDartState();  

  @override
  List<Object> get props => [];
}
class NotificationDartInitial extends NotificationDartState {}
