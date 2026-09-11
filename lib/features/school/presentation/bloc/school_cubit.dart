import 'package:school_app/features/school/domain/entities/school.dart';
import 'package:school_app/features/school/domain/repositories/school_repository.dart';
import 'package:school_app/helpers/base_cubit.dart';
import 'package:school_app/models/pagination_model.dart';

class SchoolCubit extends BaseCubit<PaginationResult<SchoolEntity>> {
  final SchoolRepository _repository;
  SchoolCubit(this._repository);

  Future<void> load() => fetchData(() => _repository.getSchools());
}
