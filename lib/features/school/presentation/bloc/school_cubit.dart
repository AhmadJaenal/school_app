import 'package:school_app/core/presentation/bloc/app_cubit.dart';
import 'package:school_app/features/school/domain/usecases/get_schools.dart';
import 'package:school_app/models/school.dart';

class SchoolCubit extends AppCubit<List<SchoolModel>> {
  SchoolCubit(this._getSchools);

  final GetSchools _getSchools;

  Future<void> load() => run(_getSchools.call);
}
