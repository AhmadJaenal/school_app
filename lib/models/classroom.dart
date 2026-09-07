class Classroom {
  final int id;
  final String name;
  final String code;
  final int capacity;
  final String description;
  final int teacherId;
  final String startDate;
  final String endDate;

  Classroom({
    required this.id,
    required this.name,
    required this.code,
    required this.capacity,
    required this.description,
    required this.teacherId,
    required this.startDate,
    required this.endDate,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      capacity: json['capacity'],
      description: json['description'],
      teacherId: json['teacher_id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'teacher_id': teacherId,
      'capacity': capacity,
      'start_date': startDate,
      'end_data': endDate,
    };
  }
}
