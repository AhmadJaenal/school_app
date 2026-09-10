class NotificationEntity {
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
}
