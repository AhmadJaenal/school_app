import 'package:school_app/features/school/data/datasources/school_remote_data_source.dart';
import 'package:school_app/models/school.dart';

class SchoolRepositoryImpl {
  SchoolRepositoryImpl(this._remoteDataSource);

  final SchoolRemoteDataSource _remoteDataSource;

  Future<List<SchoolModel>> getSchools() async {
    final result = await _remoteDataSource.getSchools();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (page) => page.data
          .map(
            (json) => SchoolModel(
              id: (json['id'] as num?)?.toInt(),
              name: json['name'] as String? ?? json['nama'] as String?,
              durationIntern:
                  (json['duration_intern'] as num?)?.toInt() ??
                  (json['duration'] as num?)?.toInt(),
            ),
          )
          .toList(),
    );
  }
}
