import 'package:school_app/features/student/domain/repositories/student_repository.dart';

class GetActivityStudent {
  final StudentRepository studentRepository;

  const GetActivityStudent(this.studentRepository);

  Future execute() async {
    return await studentRepository.getActivityStudent();
  }
}
