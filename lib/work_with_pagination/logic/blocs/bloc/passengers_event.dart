part of 'passengers_bloc.dart';

abstract class PassengersEvent extends Equatable {
  const PassengersEvent();

  @override
  List<Object> get props => [];
}

class GetPassengersEvent extends PassengersEvent {
  final bool isFirstCall;
  const GetPassengersEvent({required this.isFirstCall});
  @override
  List<Object> get props => [isFirstCall];
}

class CallInitialEvent extends PassengersEvent {
  const CallInitialEvent();
}
