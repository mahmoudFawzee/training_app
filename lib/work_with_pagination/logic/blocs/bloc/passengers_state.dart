part of 'passengers_bloc.dart';

abstract class PassengersState extends Equatable {
  const PassengersState();

  @override
  List<Object> get props => [];
}

class PassengersInitial extends PassengersState {
  const PassengersInitial();
}

class GotPassengersState extends PassengersState {
  final List<Passenger> passengers;
  const GotPassengersState({required this.passengers});
  @override
  List<Object> get props => [passengers];
}

class PassengersErrorState extends PassengersState {
  final String error;
  const PassengersErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
