class URLs {
  static const baseURL = 'http://10.54.137.106:8000/api/';

  static const classrooms = 'classrooms';
  static const classroomById = 'classroom/';
  static const currentUser = 'user/current';
  static const login = 'user/login';
  static const register = 'user/register';
  static const getAllStudent = 'user/students';
  static const getAllSchool = 'schools';
  static const newSchool = 'school';
  static const deleteSchoolById = 'school/';
  static const allProject = 'projects';
  static const getProjectById = 'project/';
  static const deleteProjectById = 'project/';
  static const getAssignmentProject = 'assignments';
  static const addAssignment = 'assignment';
  static const getProjectByAssignment = 'assignment/project/';
  static const addPresence = 'presence';
  static const checkPresence = 'presence/check';
  static const presenceByUserId = 'presence/user/';
  static const addSubmission = 'submission';
  static const getSubmissionsByUserIdAndDate = 'submissions/user/date';
  static const getAllUserBySubmissionToday = 'submissions/today';
  static const deleteSubmission = 'submission/';
  static const taskByProjectId = 'tasks/project/';
  static const taskById = 'task/';
  static const getSubmissionByTaskIdAndUserId = 'submission/task/user';
  static const getAllTask = 'tasks';
  static const addNewTask = 'task';
  static const deleteTaskById = 'task/';
}
