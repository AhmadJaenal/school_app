import 'package:school_app/models/project.dart';
import 'package:school_app/models/user.dart';

class ProjectAssignment {
  final int? id;
  final int? userId;
  final int? projectId;
  final User? user;
  final Project? project;

  ProjectAssignment({
    this.id,
    this.userId,
    this.projectId,
    this.user,
    this.project,
  });

  factory ProjectAssignment.fromJson(Map<dynamic, dynamic> json) {
    return ProjectAssignment(
      id: json['id'],
      userId: json['user_id'],
      projectId: json['project_id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      project:
          json['project'] != null ? Project.fromJson(json['project']) : null,
    );
  }

  static List<ProjectAssignment> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProjectAssignment.fromJson(json)).toList();
  }
}
