
import 'package:coin_master/features/domain/transaction/entities/transaction.dart';

abstract interface class TransactionRepository {
  Future<void> addTransaction({
    required Transaction transaction,
  });

  Future<Transaction> editTransaction({
    required Transaction transaction,
  });

  Future<void> deleteTransaction({
    required Transaction transaction,
  });

  Future<List<Transaction>> getAllTransactions();

  Future<Transaction> getTransaction({required int transactionId});
}
