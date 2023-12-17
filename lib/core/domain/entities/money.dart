import 'package:coin_master/core/domain/value_objects/amount.dart';
import 'package:coin_master/core/domain/value_objects/currency.dart';

class Money {
  final Amount? amount;
  final Currency? currency;

  const Money({this.amount, this.currency});

  @override
  String toString() => '${amount?.toString()} $currency';
}