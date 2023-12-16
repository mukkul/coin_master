import 'dart:async';

import 'package:coin_master/features/theme/domain/entities/custom_theme.dart';
import 'package:coin_master/features/theme/domain/usecases/stream_theme_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final StreamThemeUseCase _streamThemeUseCase;

  ThemeBloc({
    required StreamThemeUseCase streamThemeUseCase,
    required ThemeMode initialTheme,
  })  : _streamThemeUseCase = streamThemeUseCase,
        super(ThemeState(themeMode: initialTheme)) {
    on<ThemeChanged>(_onThemeChanged);

    _themeSubscription = _streamThemeUseCase().listen(_themeChanged);
  }

  void _themeChanged(CustomTheme theme) {
    ThemeMode themeMode =
        theme == CustomTheme.dark ? ThemeMode.dark : ThemeMode.light;
    if (themeMode != state.themeMode) {
      return add(ThemeChanged(theme));
    }
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    return event.theme == CustomTheme.light
        ? emit(state.copyWith(themeMode: ThemeMode.light))
        : emit(state.copyWith(themeMode: ThemeMode.dark));
  }
}
