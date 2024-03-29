import 'package:coin_master/core/domain/value_objects/amount.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Amount', (){
    test('Can be constructed with a positive value', (){
      final amount = Amount((a)=>a.value = 10.6);
      expect(amount.value, equals(10.50));
    });
  });
}