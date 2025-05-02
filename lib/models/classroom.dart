class Classroom {
  final int id;
  final String classname;
  final String code;
  final String description;
  final int teacherId;
  final int capacity;
  final String startDate;
  final String endDate;

  Classroom({
    required this.id,
    required this.classname,
    required this.code,
    required this.description,
    required this.teacherId,
    required this.capacity,
    required this.startDate,
    required this.endDate,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      id: json['id'],
      classname: json['name'],
      code: json['name'],
      description: json['description'],
      teacherId: json['teacher_id'],
      capacity: json['capacity'],
      startDate: json['start_date'],
      endDate: json['end_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': classname,
      'code': code,
      'description': description,
      'teacher_id': teacherId,
      'capacity': capacity,
      'start_date': startDate,
      'end_data': endDate,
    };
  }
}
