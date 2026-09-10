import 'package:school_app/core/presentation/bloc/app_cubit.dart';
import 'package:school_app/features/exam/data/models/exam_response_models.dart';
import 'package:school_app/features/exam/domain/usecases/exam_usecases.dart';
import 'package:school_app/models/pagination_model.dart';

class ExamCubit extends AppCubit<PaginationResult<ExamModel>> {
  ExamCubit(this._getExams);
  final GetExams _getExams;

  Future<void> load() => runEither(_getExams.call);
}
