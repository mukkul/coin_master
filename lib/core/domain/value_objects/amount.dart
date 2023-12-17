import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'amount.g.dart';

const String _nonNegativeAmountError = 'Amount cannot be negative.';

@BuiltValue()
abstract class Amount implements Built<Amount, AmountBuilder> {
  // Required field
  double get value;

  Amount._() {
    if (value < 0) {
      throw ArgumentError(_nonNegativeAmountError);
    }
  }

  factory Amount([void Function(AmountBuilder) updates]) = _$Amount;

  static Serializer<Amount> get serializer => _$amountSerializer;

  @override
  String toString() => value.toStringAsFixed(2);
}
