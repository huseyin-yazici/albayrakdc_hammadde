part of 'acceptance_control_bloc.dart';

sealed class AcceptanceControlEvent extends Equatable {
  const AcceptanceControlEvent();
}

class RecognizeTextFromCameraEvent extends AcceptanceControlEvent {
  @override
  List<Object> get props => [];
}
