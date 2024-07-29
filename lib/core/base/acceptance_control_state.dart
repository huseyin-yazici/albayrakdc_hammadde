part of 'acceptance_control_bloc.dart';

abstract class AcceptanceControlState extends Equatable {
  const AcceptanceControlState();
}

final class AcceptanceControlInitial extends AcceptanceControlState {
  @override
  List<Object> get props => [];
}

class AcceptanceControlSuccess extends AcceptanceControlState{
  @override
  List<Object?> get props => [];

}