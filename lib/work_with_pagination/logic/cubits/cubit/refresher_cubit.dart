import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'refresher_state.dart';

class RefresherCubit extends Cubit<bool?> {
  RefresherCubit() : super(null);
  void emitNewState(bool newState) {
    emit(newState);
  }
}
