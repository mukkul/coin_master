
import 'package:coin_master/features/transaction/domain/entities/transaction_entity.dart';

abstract interface class TransactionRepository {
  Future<void> addTransaction({
    required TransactionEntity transaction,
  });

  Future<TransactionEntity> editTransaction({
    required TransactionEntity transaction,
  });

  Future<void> deleteTransaction({
    required TransactionEntity transaction,
  });

  Future<List<TransactionEntity>> getAllTransactions();

  Future<TransactionEntity> getTransaction({required int transactionId});
}
