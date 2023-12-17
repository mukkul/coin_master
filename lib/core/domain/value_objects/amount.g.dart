// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Amount> _$amountSerializer = new _$AmountSerializer();

class _$AmountSerializer implements StructuredSerializer<Amount> {
  @override
  final Iterable<Type> types = const [Amount, _$Amount];
  @override
  final String wireName = 'Amount';

  @override
  Iterable<Object?> serialize(Serializers serializers, Amount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Amount deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AmountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Amount extends Amount {
  @override
  final double value;

  factory _$Amount([void Function(AmountBuilder)? updates]) =>
      (new AmountBuilder()..update(updates))._build();

  _$Amount._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'Amount', 'value');
  }

  @override
  Amount rebuild(void Function(AmountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AmountBuilder toBuilder() => new AmountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Amount && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class AmountBuilder implements Builder<Amount, AmountBuilder> {
  _$Amount? _$v;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  AmountBuilder();

  AmountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Amount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Amount;
  }

  @override
  void update(void Function(AmountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Amount build() => _build();

  _$Amount _build() {
    final _$result = _$v ??
        new _$Amount._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'Amount', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
