class Presence {
  final int? id;
  final int? day;
  final String? status;

  Presence({
    this.id,
    this.status,
    this.day,
  });

  factory Presence.fromJson(Map<dynamic, dynamic> json) {
    return Presence(
      id: json['id'],
      status: json['status'],
      day: json['day'],
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
