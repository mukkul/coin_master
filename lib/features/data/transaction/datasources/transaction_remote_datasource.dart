import 'package:coin_master/features/domain/transaction/entities/transaction.dart';

abstract class TransactionRemoteDatasource {
  Future<Transaction?> get transaction;
  Stream<List<Transaction>> getAllTransaction();
  Future<void> addTransaction({
    required Transaction transaction,
  });
  Future<void> deleteTransactin({
    required Transaction transaction,
  });
  Future<Transaction> editTransaction({
    Transaction transaction,
  }); 
}
