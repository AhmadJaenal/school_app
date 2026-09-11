import 'package:school_app/features/dailyTest/domain/entities/daily_test.dart';

class DailyTestModel extends DailyTestEntity {
  const DailyTestModel({super.id, super.title, super.date, super.subjectId});

  factory DailyTestModel.fromJson(Map<String, dynamic> json) {
    return DailyTestModel(
      id: json['id']?.toString(),
      title: json['judul'] as String? ?? json['title'] as String?,
      date: json['tanggal'] as String? ?? json['date'] as String?,
      subjectId: json['subject_id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'date': date,
    'subject_id': subjectId,
  };
}
