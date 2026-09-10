import 'package:school_app/features/school/data/repositories/school_repository_impl.dart';
import 'package:school_app/models/school.dart';

class GetSchools {
  GetSchools(this._repository);

  final SchoolRepositoryImpl _repository;

  Future<List<SchoolModel>> call() => _repository.getSchools();
}
