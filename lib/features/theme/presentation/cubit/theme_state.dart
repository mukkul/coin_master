part of 'theme_cubit.dart';

class ThemeCubitState extends Equatable {
  final ThemeMode themeMode;
  const ThemeCubitState({
    this.themeMode = ThemeMode.light,
  });

  @override
  List<Object?> get props => [themeMode];

  ThemeCubitState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeCubitState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
