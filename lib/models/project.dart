class Project {
  final int? id;
  final String? name;
  final String? desc;
  final String? asset;

  Project({
    this.id,
    this.name,
    this.desc,
    this.asset,
  });

  factory Project.fromJson(Map<dynamic, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      asset: json['asset'],
    );
  }

  static List<Project> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Project.fromJson(json)).toList();
  }
}
