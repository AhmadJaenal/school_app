import 'package:school_app/features/notification/domain/entities/notification.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    super.id,
    super.title,
    super.message,
    super.readAt,
    super.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id']?.toString(),
      title: json['judul'] as String? ?? json['title'] as String?,
      message: json['pesan'] as String? ?? json['message'] as String?,
      readAt: json['read_at'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'message': message,
    'read_at': readAt,
    'created_at': createdAt,
  };
}
