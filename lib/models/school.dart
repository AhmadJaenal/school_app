class SchoolModel {
  final int? id;
  final String? name;
  final int? durationIntern;

  SchoolModel({
    this.id,
    this.name,
    this.durationIntern,
  });

  factory SchoolModel.fromJson(Map<dynamic, dynamic> json) {
    return SchoolModel(
      id: json['id'],
      name: json['name'],
      durationIntern: json['duration_intern'],
    );
  }

  static List<SchoolModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SchoolModel.fromJson(json)).toList();
  }
}
