import 'package:school_app/features/exam/domain/entities/exam_entities.dart';
import 'package:school_app/features/exam/domain/usecases/exam_usecases.dart';
import 'package:school_app/helpers/base_cubit.dart';
import 'package:school_app/models/pagination_model.dart';

class ExamCubit extends BaseCubit<PaginationResult<ExamEntity>> {
  ExamCubit(this._getExams);
  final GetExams _getExams;

  Future<void> load() => fetchData(_getExams.call);
}
