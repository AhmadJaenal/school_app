import 'package:school_app/core/presentation/bloc/app_cubit.dart';
import 'package:school_app/features/dailyTest/domain/usecases/daily_test_usecases.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';
import 'package:school_app/models/pagination_model.dart';

class DailyTestCubit extends AppCubit<PaginationResult<DailyTestModel>> {
  DailyTestCubit(this._getDailyTests);
  final GetDailyTests _getDailyTests;

  Future<void> load() => runEither(_getDailyTests.call);
}
