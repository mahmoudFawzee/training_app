import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_training/futures/data/services/app_settings_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial());
  void changeTheme() async {
    final bool isDark = await AppSettingsService.changeMode();
    emit(GotThemeModeState(isDark));
  }

  void getTheme() async {
    final bool isDark = await AppSettingsService.getMode();
    emit(GotThemeModeState(isDark));
  }
}
