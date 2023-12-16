class AuthLocalDatasource {
  final Map<String, Object?> authLocalDatasource;

  //when i build the local data source i initialize with empty map
  AuthLocalDatasource() : authLocalDatasource = <String, Object?>{};

  void write<T extends Object?>({required String key, T? value}) {
    authLocalDatasource[key] = value;
  }

  T? read<T extends Object?>({required String key}) {
    final value = authLocalDatasource[key];
    if (value is T) return value;
    return null;
  }
}
