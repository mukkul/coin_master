import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'currency.g.dart';

const String _emptyCurrencyError = 'Currency code cannot be empty.';

@BuiltValue()
abstract class Currency implements Built<Currency, CurrencyBuilder> {
  // Required field
  String get code;
  Currency._() {
    if (code.isEmpty) {
      throw ArgumentError(_emptyCurrencyError);
    }
  }

  factory Currency([void Function(CurrencyBuilder) updates]) = _$Currency;

  static Serializer<Currency> get serializer => _$currencySerializer;

  @override
  String toString() => code;
}