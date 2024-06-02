import 'package:school_app/features/student/domain/repositories/student_repository.dart';

class GetEvent {
  final StudentRepository studentRepository;

  const GetEvent(this.studentRepository);

  Future execute() async {
    return await studentRepository.getEvent();
  }
}
