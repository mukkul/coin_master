import 'package:coin_master/features/theme/domain/entities/custom_theme.dart';
import 'package:coin_master/features/theme/domain/repositories/theme_repository.dart';
import 'package:coin_master/shared/domain/usecases/base_usecases.dart';

class SwitchThemeParams extends Params {
  final bool isDarkMode;

  SwitchThemeParams({
    required this.isDarkMode,
  });

  @override
  List<Object?> get props => [isDarkMode];
}

class SwitchThemeUseCase extends UseCase<void, SwitchThemeParams> {
  final ThemeRepository themeRepository;
  SwitchThemeUseCase({
    required this.themeRepository,
  });

  @override
  Future<void> call(SwitchThemeParams params) async {
    if (params.isDarkMode) {
      themeRepository.saveTheme(CustomTheme.dark);
    } else {
      themeRepository.saveTheme(CustomTheme.light);
    }
  }
}
