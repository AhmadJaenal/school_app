class Presence {
  final int? id;
  final int? day;
  final String? status;
  final String? type;
  final String? createdAt;
  final String? updatedAt;

  Presence({
    this.id,
    this.status,
    this.day,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Presence.fromJson(Map<dynamic, dynamic> json) {
    return Presence(
      id: json['id'],
      status: json['status'],
      day: json['day'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  static List<Presence> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Presence.fromJson(json)).toList();
  }
}

class CountPresence {
  final int? present;
  final int? sick;
  final int? permission;
  final int? absent;

  CountPresence({
    this.present,
    this.sick,
    this.permission,
    this.absent,
  });
}
