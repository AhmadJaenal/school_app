import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../event/domain/entities/event_entity.dart';

abstract class EventRepository {
  Future<Either<Failure, List<EventEntity>>> getEvent();
}
