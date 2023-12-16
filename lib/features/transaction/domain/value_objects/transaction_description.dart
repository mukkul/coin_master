import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:coin_master/constants/error_messages/error_messages.dart';

part 'transaction_description.g.dart';

const String _invalidKeywordsError = 'Keywords cannot be empty strings.';

@BuiltValue()
abstract class TransactionDescription implements Built<TransactionDescription, TransactionDescriptionBuilder> {
  // Required field
  String get text;

  // Optional fields
  String? get normalizedText;
  List<String>? get keywords;
  double? get sentiment;

  TransactionDescription._() {
    if (text.length < 3 || text.length > 255) {
      throw ArgumentError(ErrorMessages.transactionDescriptionTooShort);
    }
    if (text.isEmpty) {
      throw ArgumentError(ErrorMessages.emptyTransactionDescriptionError);
    }
    if (keywords != null) {
      if (keywords!.any((keyword) => keyword.isEmpty)) {
        throw ArgumentError(_invalidKeywordsError);
      }
    }
    // ... Additional validation checks for other fields ...
  }

  factory TransactionDescription([void Function(TransactionDescriptionBuilder) updates]) = _$TransactionDescription;

  static Serializer<TransactionDescription> get serializer => _$transactionDescriptionSerializer;
}
