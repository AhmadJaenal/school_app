import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edumart_event.dart';
part 'edumart_state.dart';

class EdumartBloc extends Bloc<EdumartEvent, EdumartState> {
  EdumartBloc() : super(EdumartInitial()) {
    on<EdumartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
