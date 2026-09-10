import 'package:school_app/features/school/domain/repositories/school_repository.dart';
import 'package:school_app/models/school.dart';

class GetSchools {
  GetSchools(this._repository);

  final SchoolRepository _repository;

  Future<List<SchoolModel>> call() => _repository.getSchools();
}
