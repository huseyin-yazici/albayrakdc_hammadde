part of 'acceptance_control_bloc.dart';

abstract class AcceptanceControlState extends Equatable {
  const AcceptanceControlState();

  @override
  List<Object> get props => [];
}

class AcceptanceControlInitial extends AcceptanceControlState {}

class AcceptanceControlLoading extends AcceptanceControlState {}

class AcceptanceControlSuccess extends AcceptanceControlState {
  final Map<String, String> extractedData;

  AcceptanceControlSuccess({required this.extractedData});

  @override
  List<Object> get props => [extractedData];
}

class AcceptanceControlFailure extends AcceptanceControlState {
  final String error;

  AcceptanceControlFailure({required this.error});

  @override
  List<Object> get props => [error];
}
