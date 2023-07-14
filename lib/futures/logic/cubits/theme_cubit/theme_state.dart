part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial();
}

class GotThemeModeState extends ThemeState {
  final bool isDark;
  const GotThemeModeState(
    this.isDark
  );
  @override
  
  List<Object> get props => [isDark];
}
