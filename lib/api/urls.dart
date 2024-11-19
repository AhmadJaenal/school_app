class URLs {
  static const baseURL = 'http://192.168.1.6:8000';

  static const String register = "$baseURL/api/register";
  static const String login = "$baseURL/api/login";
  static const String allProject = "$baseURL/api/project";
  static const String getProjectByAssignment =
      "$baseURL/api/project/assignment/user";
  static const String getProjectById = "$baseURL/api/project";
  static const String deleteProjectById = "$baseURL/api/project/";

  static const String taskByProjectId = "$baseURL/api/task/project/";
  static const String taskById = "$baseURL/api/task/";
  static const String deleteTaskById = "$baseURL/api/task/";
  static const String addNewTask = "$baseURL/api/task/add";

  static const String presenceByUserId = "$baseURL/api/presence";
  static const String checkPresence = "$baseURL/api/presence/check";
  static const String addPresence = "$baseURL/api/presence/add";
  static const String addSubmission = "$baseURL/api/submission/add";
  static const String getSubmissionByTaskId = "$baseURL/api/submission/task/";
  static const String getSubmissionByTaskIdAndUserId =
      "$baseURL/api/submission/user/task/";
  static const String deleteSubmission = "$baseURL/api/submission";
  static const String getAllStudent = "$baseURL/api/admin/all/internship";
  static const String getSubmissionsByUserIdAndDate =
      "$baseURL/api/submissions/user";

  static const String getAllSchool = "$baseURL/api/schools";
  static const String newSchool = "$baseURL/api/school/add";
  static const String getAllTask = "$baseURL/api/task";
  static const String deleteSchoolById = "$baseURL/api/school/";
  static const String getAllUserBySubmissionToday =
      "$baseURL/api/admin/all/user/submission/today";

  static const String getAssignmentProject = "$baseURL/api/admin/assignment";
}
