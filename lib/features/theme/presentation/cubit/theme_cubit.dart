import 'package:coin_master/features/theme/domain/usecases/switch_theme_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  final SwitchThemeUseCase _switchThemeUseCase;

  ThemeCubit({required SwitchThemeUseCase switchThemeUseCase})
      : _switchThemeUseCase = switchThemeUseCase,
        super(const ThemeCubitState());

  void switchTheme(ThemeMode themeMode) async {
    debugPrint('switching');
    bool isDarkMode = themeMode == ThemeMode.dark;
    await _switchThemeUseCase(SwitchThemeParams(isDarkMode: isDarkMode));
  }
}
