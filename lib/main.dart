import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/futures/logic/cubits/files_cubit/files_cubit.dart';
import 'package:flutter_training/futures/logic/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_training/futures/view/screens/files_app/files_home.dart';
import 'package:flutter_training/futures/view/screens/files_app/password_screen.dart';
import 'package:flutter_training/futures/view/screens/pizza_app/pizza_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit()..getTheme(),
        ),
        BlocProvider(
          create: (context) => FilesCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is GotThemeModeState) {
            final bool isDark = state.isDark;
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.red, centerTitle: true),
                scaffoldBackgroundColor: Colors.white,
              ),
              darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black, centerTitle: false),
                scaffoldBackgroundColor: Colors.brown,
              ),
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              home: const PasswordScreen(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
