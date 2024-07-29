import 'package:equatable/equatable.dart';

part 'acceptance_control_event.dart';

part 'acceptance_control_state.dart';

class AcceptanceControlBloc
    extends Bloc<AcceptanceControlEvent, AcceptanceControlState> {
  AcceptanceControlBloc() : super(AcceptanceControlInitial()) {
    on<AcceptanceControlEvent>((event, emit) {});
  }
}
