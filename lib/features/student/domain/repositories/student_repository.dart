import '../entities/student.dart';

abstract class StudentRepository {
  Future<StudentEntity> getStudentData(int id);
  Future getHistoryTransaction();
  Future getActivityStudent();
  Future getEvent();
}
