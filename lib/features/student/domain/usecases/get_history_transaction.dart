import '../repositories/student_repository.dart';

class GetHistoryTransaction {
  final StudentRepository studentRepository;

  const GetHistoryTransaction(this.studentRepository);

  Future execute() async {
    return await studentRepository.getHistoryTransaction();
  }
}
