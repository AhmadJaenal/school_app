import 'package:equatable/equatable.dart';

class DailyTestEntity extends Equatable {
  const DailyTestEntity({this.id, this.title, this.date, this.subjectId});
  final String? id;
  final String? title;
  final String? date;
  final String? subjectId;

  @override
  List<Object?> get props => [id, title, date, subjectId];
}
