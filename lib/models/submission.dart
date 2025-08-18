class Submission {
  final int? id;
  final int? taskId;
  final int? userId;
  final String? desc;
  final String? urlImage;
  final String? createdAt;

  Submission({
    this.id,
    this.taskId,
    this.userId,
    this.desc,
    this.urlImage,
    this.createdAt,
  });

  factory Submission.fromJson(Map<dynamic, dynamic> json) {
    return Submission(
      id: json['id'],
      taskId: json['task_id'],
      userId: json['user_id'],
      desc: json['desc'],
      urlImage: json['url_image'],
      createdAt: json['created_at'],
    );
  }

  static List<Submission> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Submission.fromJson(json)).toList();
  }
}
