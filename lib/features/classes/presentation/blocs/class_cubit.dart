import 'package:school_app/features/classes/domain/entities/class_entities.dart';
import 'package:school_app/features/classes/domain/repositories/classes_repository.dart';
import 'package:school_app/helpers/base_cubit.dart';
import 'package:school_app/models/pagination_model.dart';

class ClassCubit extends BaseCubit<PaginationResult<ClassEntity>> {
  final ClassesRepository _repository;
  ClassCubit(this._repository);

  void load() => fetchData(() => _repository.getClasses());
}
