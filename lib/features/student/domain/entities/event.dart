import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final int id;
  final String eventName;
  final String date;
  final String imageUrl;
  final String content;

  const EventEntity({
    required this.id,
    required this.eventName,
    required this.date,
    required this.imageUrl,
    required this.content,
  });

  @override
  List<Object?> get props {
    return [
      id,
      eventName,
      date,
      imageUrl,
      content,
    ];
  }
}
