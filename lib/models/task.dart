class TaskModel {
  final int? id;
  final int? projectId;
  final String? title;
  final String? desc;
  final String? module;

  TaskModel({
    this.id,
    this.projectId,
    this.title,
    this.desc,
    this.module,
  });

  factory TaskModel.fromJson(Map<dynamic, dynamic> json) {
    return TaskModel(
      id: json['id'],
      projectId: json['project_id'],
      title: json['title'],
      desc: json['desc'],
      module: json['module'],
    );
  }

  static List<TaskModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TaskModel.fromJson(json)).toList();
  }
}
