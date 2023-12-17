import 'package:coin_master/features/theme/domain/entities/custom_theme.dart';
import 'package:coin_master/features/theme/domain/repositories/theme_repository.dart';

class StreamThemeUseCase {
  final ThemeRepository themeRepository;
  StreamThemeUseCase({required this.themeRepository});

  Stream<CustomTheme> call() {
    try {
      return themeRepository.getTheme();
    } catch (error) {
      throw Exception(error);
    }
  }
}
