// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Currency> _$currencySerializer = new _$CurrencySerializer();

class _$CurrencySerializer implements StructuredSerializer<Currency> {
  @override
  final Iterable<Type> types = const [Currency, _$Currency];
  @override
  final String wireName = 'Currency';

  @override
  Iterable<Object?> serialize(Serializers serializers, Currency object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Currency deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CurrencyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Currency extends Currency {
  @override
  final String code;

  factory _$Currency([void Function(CurrencyBuilder)? updates]) =>
      (new CurrencyBuilder()..update(updates))._build();

  _$Currency._({required this.code}) : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'Currency', 'code');
  }

  @override
  Currency rebuild(void Function(CurrencyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrencyBuilder toBuilder() => new CurrencyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Currency && code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class CurrencyBuilder implements Builder<Currency, CurrencyBuilder> {
  _$Currency? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  CurrencyBuilder();

  CurrencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Currency;
  }

  @override
  void update(void Function(CurrencyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Currency build() => _build();

  _$Currency _build() {
    final _$result = _$v ??
        new _$Currency._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'Currency', 'code'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
