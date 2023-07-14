part of 'password_cubit.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object?> get props => [];
}

class PasswordInitial extends PasswordState {
  const PasswordInitial();
}

class RightPasswordState extends PasswordState {
  const RightPasswordState();
}

class WrongPasswordState extends PasswordState {
  const WrongPasswordState();
}

class WrotePasswordState extends PasswordState {
  final String password;
  const WrotePasswordState({required this.password});
  @override
  List<Object?> get props => [password];
}

class NoPasswordState extends PasswordState {
  const NoPasswordState();
}
