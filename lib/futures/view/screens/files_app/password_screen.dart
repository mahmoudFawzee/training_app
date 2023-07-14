import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/futures/logic/cubits/password_cubit/password_cubit.dart';
import 'package:flutter_training/futures/view/screens/files_app/files_home.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});
  static final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordCubit()..checkPasswordExists(),
      child: Scaffold(
        body: BlocConsumer<PasswordCubit, PasswordState>(
          listener: (context, state) {
            if (state is WrotePasswordState) {
              context.read<PasswordCubit>().checkPassword(state.password);
            } else if (state is RightPasswordState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FilesAppHome(),
                ),
              );
              context.read<PasswordCubit>().callInitial();
            } else if (state is WrongPasswordState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'wrong password',
                  ),
                ),
              );
              context.read<PasswordCubit>().callInitial();
            }
          },
          builder: (context, state) {
            log('$state');
            if (state is NoPasswordState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _passController,
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_passController.value.text.isNotEmpty) {
                        context.read<PasswordCubit>().savePassword(
                              _passController.value.text,
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'password can not be empty',
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'set password',
                    ),
                  ),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _passController,
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<PasswordCubit>()
                        .checkPassword(_passController.value.text);
                  },
                  child: const Text(
                    'enter',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
