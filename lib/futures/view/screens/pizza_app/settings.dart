import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/futures/logic/cubits/theme_cubit/theme_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.dark_mode,
              ),
              title: const Text('dark mode'),
              trailing: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  if (state is GotThemeModeState) {
                    return Switch(
                      value: state.isDark,
                      onChanged: (_) {
                        context.read<ThemeCubit>().changeTheme();
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.language,
              ),
              title: const Text('en'),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
