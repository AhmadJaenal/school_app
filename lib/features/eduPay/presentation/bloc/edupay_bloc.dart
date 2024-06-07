import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edupay_event.dart';
part 'edupay_state.dart';

class EdupayBloc extends Bloc<EdupayEvent, EdupayState> {
  EdupayBloc() : super(EdupayInitial()) {
    on<EdupayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
