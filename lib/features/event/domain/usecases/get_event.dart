import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../event/domain/entities/event_entity.dart';
import '../repositories/event_repository.dart';

class GetEvent {
  final EventRepository eventRepository;

  const GetEvent(this.eventRepository);

  Future<Either<Failure, List<EventEntity>>> execute() async {
    return await eventRepository.getEvent();
  }
}
