import 'dart:async';

import 'package:coin_master/features/theme/data/datasources/theme_local_datasource.dart';
import 'package:coin_master/features/theme/domain/entities/custom_theme.dart';
import 'package:coin_master/features/theme/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;
  final _controller = StreamController<CustomTheme>();
  static const _kThemePersistenceKey = '__theme_persistence_key__';
  ThemeRepositoryImpl({required this.localDataSource}) {
    _init();
  }

  @override
  Stream<CustomTheme> getTheme() async* {
    yield* _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
  }

  @override
  Future<void> saveTheme(CustomTheme theme) async {
    _controller.add(theme);
    localDataSource.setValue(_kThemePersistenceKey, theme.name);
  }

  void _init() {
    final themeString = localDataSource.getValue(_kThemePersistenceKey);
    if (themeString != null) {
      if (themeString == CustomTheme.light.name) {
        _controller.add(CustomTheme.light);
      } else {
        _controller.add(CustomTheme.dark);
      }
    } else {
      _controller.add(CustomTheme.light);
    }
  }
}
