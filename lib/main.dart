import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/area_package/screens/area_home_screen.dart';
import 'package:flutter_training/futures/logic/cubits/files_cubit/files_cubit.dart';
import 'package:flutter_training/futures/logic/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_training/work_with_pagination/logic/blocs/bloc/passengers_bloc.dart';
import 'package:flutter_training/work_with_pagination/view/home.dart';

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
              home: BlocProvider(
                create: (context) => PassengersBloc()
                  ..add(const GetPassengersEvent(isFirstCall: true)),
                child: const PassengersHomeScreen(),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
