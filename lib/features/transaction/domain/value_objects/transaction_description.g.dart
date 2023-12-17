// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_description.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionDescription> _$transactionDescriptionSerializer =
    new _$TransactionDescriptionSerializer();

class _$TransactionDescriptionSerializer
    implements StructuredSerializer<TransactionDescription> {
  @override
  final Iterable<Type> types = const [
    TransactionDescription,
    _$TransactionDescription
  ];
  @override
  final String wireName = 'TransactionDescription';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TransactionDescription object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.normalizedText;
    if (value != null) {
      result
        ..add('normalizedText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.keywords;
    if (value != null) {
      result
        ..add('keywords')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(List, const [const FullType(String)])));
    }
    value = object.sentiment;
    if (value != null) {
      result
        ..add('sentiment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  TransactionDescription deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionDescriptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'normalizedText':
          result.normalizedText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'keywords':
          result.keywords = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(String)]))
              as List<String>?;
          break;
        case 'sentiment':
          result.sentiment = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionDescription extends TransactionDescription {
  @override
  final String text;
  @override
  final String? normalizedText;
  @override
  final List<String>? keywords;
  @override
  final double? sentiment;

  factory _$TransactionDescription(
          [void Function(TransactionDescriptionBuilder)? updates]) =>
      (new TransactionDescriptionBuilder()..update(updates))._build();

  _$TransactionDescription._(
      {required this.text, this.normalizedText, this.keywords, this.sentiment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        text, r'TransactionDescription', 'text');
  }

  @override
  TransactionDescription rebuild(
          void Function(TransactionDescriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionDescriptionBuilder toBuilder() =>
      new TransactionDescriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionDescription &&
        text == other.text &&
        normalizedText == other.normalizedText &&
        keywords == other.keywords &&
        sentiment == other.sentiment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, normalizedText.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, sentiment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionDescription')
          ..add('text', text)
          ..add('normalizedText', normalizedText)
          ..add('keywords', keywords)
          ..add('sentiment', sentiment))
        .toString();
  }
}

class TransactionDescriptionBuilder
    implements Builder<TransactionDescription, TransactionDescriptionBuilder> {
  _$TransactionDescription? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _normalizedText;
  String? get normalizedText => _$this._normalizedText;
  set normalizedText(String? normalizedText) =>
      _$this._normalizedText = normalizedText;

  List<String>? _keywords;
  List<String>? get keywords => _$this._keywords;
  set keywords(List<String>? keywords) => _$this._keywords = keywords;

  double? _sentiment;
  double? get sentiment => _$this._sentiment;
  set sentiment(double? sentiment) => _$this._sentiment = sentiment;

  TransactionDescriptionBuilder();

  TransactionDescriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _normalizedText = $v.normalizedText;
      _keywords = $v.keywords;
      _sentiment = $v.sentiment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionDescription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionDescription;
  }

  @override
  void update(void Function(TransactionDescriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionDescription build() => _build();

  _$TransactionDescription _build() {
    final _$result = _$v ??
        new _$TransactionDescription._(
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'TransactionDescription', 'text'),
            normalizedText: normalizedText,
            keywords: keywords,
            sentiment: sentiment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
