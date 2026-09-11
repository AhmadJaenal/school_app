import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  const NotificationEntity({
    this.id,
    this.title,
    this.message,
    this.readAt,
    this.createdAt,
  });
  final String? id;
  final String? title;
  final String? message;
  final String? readAt;
  final String? createdAt;

  @override
  List<Object?> get props => [id, title, message, readAt, createdAt];
}
