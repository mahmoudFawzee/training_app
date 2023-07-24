import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_training/futures/logic/cubits/password_cubit/password_cubit.dart';
import 'package:flutter_training/work_with_pagination/data/models/passenger.dart';
import 'package:flutter_training/work_with_pagination/data/service/passengers_service.dart';

part 'passengers_event.dart';
part 'passengers_state.dart';

class PassengersBloc extends Bloc<PassengersEvent, PassengersState> {
  static final List<Passenger> _passengers = [];
  PassengersBloc() : super(const PassengersInitial()) {
    on<GetPassengersEvent>((event, emit) async {
      if (event.isFirstCall) _passengers.clear();
      final result =
          await PassengersService.getPassengers(isInitial: event.isFirstCall);
      if (result != null) {
        _passengers.addAll(result);
        emit(GotPassengersState(passengers: _passengers));
      } else {
        emit(const PassengersErrorState(error: 'some error ocurred'));
      }
    });

    on<CallInitialEvent>((event, emit) {
      emit(const PassengersInitial());
    });
  }
}
