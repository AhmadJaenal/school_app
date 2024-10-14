class URLs {
  static const baseURL = 'http://172.30.8.188:8000';

  static const String register = "$baseURL/api/student/register";
  static const String login = "$baseURL/api/login";
  static const String allProject = "$baseURL/api/project";
  static const String taskByProjectId = "$baseURL/api/task/project/";
  static const String taskById = "$baseURL/api/task/";
  static const String presenceByUserId = "$baseURL/api/presence/3/user";
  static const String addPresence = "$baseURL/api/presence/add";
}
