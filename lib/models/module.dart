class Module {
  final int id;
  final String title;
  final String description;
  final String filePath;
  final int userId;

  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.filePath,
    required this.userId,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      filePath: json['file_path'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'file_path': filePath,
      'user_id': userId,
    };
  }
}
