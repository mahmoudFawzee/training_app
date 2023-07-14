import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_training/futures/data/services/secure_storage_service.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(const PasswordInitial());
  void callInitial() {
    emit(const PasswordInitial());
  }

  void savePassword(String password) async {
    await SecureStorageService.storePass(password);
    emit(WrotePasswordState(password: password));
  }

  void checkPasswordExists() async {
    final password = await SecureStorageService.getPass();
    if (password == null) {
      emit(const NoPasswordState());
    }
  }

  void checkPassword(String password) async {
    final storedPassword = await SecureStorageService.getPass();
    if (password == storedPassword) {
      emit(const RightPasswordState());
    } else {
      emit(const WrongPasswordState());
    }
  }
}
