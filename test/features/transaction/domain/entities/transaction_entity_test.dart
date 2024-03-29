import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_master/features/transaction/domain/entities/transaction_entity.dart';
import 'package:coin_master/features/transaction/domain/entities/transaction_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tests on transaction entity', () {
    test('Transaction entity should accept null transaction id', () {
      final transaction = TransactionEntity(
        amount: 423423.2,
        transactionDateTime: Timestamp.fromMicrosecondsSinceEpoch(23423432),
        transactionType: TransactionType.credit,
        category: 'category',
      );
      expect(transaction.transactionId, isNull);
    });

    test('Props should return all transaction entity', () {
      final transaction = TransactionEntity(
        transactionId: 'transactionId',
        amount: 343.34,
        transactionDateTime: Timestamp.fromMicrosecondsSinceEpoch(8896),
        transactionType: TransactionType.credit,
        category: 'category',
        description: 'description'
      );
      expect(transaction.props, [
        'transactionId',
        343.34,
        Timestamp.fromMicrosecondsSinceEpoch(8896),
        TransactionType.credit,
        'category',
        'description'
      ]);
    });
  });
}
