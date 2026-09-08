class ApiPage<T> {
  const ApiPage({
    required this.items,
    this.page,
    this.limit,
    this.totalData,
    this.totalPage,
  });

  final List<T> items;
  final int? page;
  final int? limit;
  final int? totalData;
  final int? totalPage;

  factory ApiPage.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final raw = json['data'];
    return ApiPage(
      items: raw is List
          ? raw.whereType<Map<String, dynamic>>().map(fromJson).toList()
          : const [],
      page: (json['pagination']?['page'] as num?)?.toInt(),
      limit: (json['pagination']?['limit'] as num?)?.toInt(),
      totalData: (json['pagination']?['total_data'] as num?)?.toInt(),
      totalPage: (json['pagination']?['total_page'] as num?)?.toInt(),
    );
  }
}

class ClassModel {
  const ClassModel({
    this.id,
    this.schoolId,
    this.name,
    this.code,
    this.capacity,
  });
  final int? id;
  final int? schoolId;
  final String? name;
  final String? code;
  final int? capacity;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    id: (json['id'] as num?)?.toInt(),
    schoolId: (json['school_id'] as num?)?.toInt(),
    name: json['nama_kelas'] as String? ?? json['name'] as String?,
    code: json['kode_kelas'] as String? ?? json['code'] as String?,
    capacity:
        (json['kapasitas'] as num?)?.toInt() ??
        (json['capacity'] as num?)?.toInt(),
  );
}

class SubjectModel {
  const SubjectModel({this.id, this.name, this.code, this.description});
  final int? id;
  final String? name;
  final String? code;
  final String? description;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    id: (json['id'] as num?)?.toInt(),
    name: json['nama'] as String? ?? json['name'] as String?,
    code: json['kode'] as String? ?? json['code'] as String?,
    description: json['deskripsi'] as String? ?? json['description'] as String?,
  );
}

class ExamModel {
  const ExamModel({
    this.id,
    this.title,
    this.description,
    this.status,
    this.startAt,
    this.endAt,
  });
  final int? id;
  final String? title;
  final String? description;
  final String? status;
  final String? startAt;
  final String? endAt;

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
    id: (json['id'] as num?)?.toInt(),
    title: json['judul'] as String? ?? json['title'] as String?,
    description: json['deskripsi'] as String? ?? json['description'] as String?,
    status: json['status'] as String?,
    startAt: json['waktu_mulai'] as String? ?? json['start_at'] as String?,
    endAt: json['waktu_selesai'] as String? ?? json['end_at'] as String?,
  );
}

class DailyTestModel {
  const DailyTestModel({this.id, this.title, this.date, this.subjectId});
  final int? id;
  final String? title;
  final String? date;
  final int? subjectId;

  factory DailyTestModel.fromJson(Map<String, dynamic> json) => DailyTestModel(
    id: (json['id'] as num?)?.toInt(),
    title: json['judul'] as String? ?? json['title'] as String?,
    date: json['tanggal'] as String? ?? json['date'] as String?,
    subjectId: (json['subject_id'] as num?)?.toInt(),
  );
}

class NotificationModel {
  const NotificationModel({
    this.id,
    this.title,
    this.message,
    this.readAt,
    this.createdAt,
  });
  final int? id;
  final String? title;
  final String? message;
  final String? readAt;
  final String? createdAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: (json['id'] as num?)?.toInt(),
        title: json['judul'] as String? ?? json['title'] as String?,
        message: json['pesan'] as String? ?? json['message'] as String?,
        readAt: json['read_at'] as String?,
        createdAt: json['created_at'] as String?,
      );
}

class GpsLogModel {
  const GpsLogModel({
    this.id,
    this.studentId,
    this.latitude,
    this.longitude,
    this.activity,
    this.recordedAt,
  });
  final int? id;
  final int? studentId;
  final double? latitude;
  final double? longitude;
  final String? activity;
  final String? recordedAt;

  factory GpsLogModel.fromJson(Map<String, dynamic> json) => GpsLogModel(
    id: (json['id'] as num?)?.toInt(),
    studentId: (json['student_id'] as num?)?.toInt(),
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    activity: json['jenis_aktivitas'] as String?,
    recordedAt: json['recorded_at'] as String?,
  );
}
