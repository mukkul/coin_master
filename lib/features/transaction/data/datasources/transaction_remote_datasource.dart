import 'package:coin_master/features/transaction/domain/entities/transaction_entity.dart';

abstract class TransactionRemoteDatasource {
  Future<TransactionEntity?> get transaction;
  Stream<List<TransactionEntity>> getAllTransaction();
  Future<void> addTransaction({
    required TransactionEntity transaction,
  });
  Future<void> deleteTransaction({
    required TransactionEntity transaction,
  });
  Future<TransactionEntity> editTransaction({
    TransactionEntity transaction,
  }); 
}
