import '../../domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel({
    required super.id,
    required super.eventName,
    required super.date,
    required super.imageUrl,
    required super.content,
  }) : super();

  factory EventModel.fromjson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      eventName: json['event_name'],
      date: json['date'],
      imageUrl: json['image_url'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "event_name": eventName,
      "date": date,
      "image_url": imageUrl,
      "content": content,
    };
  }

  static List<EventModel> fromJsonLlist(List data) {
    if (data.isEmpty) return [];

    return data
        .map((singleDataEvent) => EventModel.fromjson(singleDataEvent))
        .toList();
  }
}
