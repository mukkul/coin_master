import 'package:coin_master/features/domain/transaction/entities/transaction.dart';
import 'package:coin_master/features/domain/transaction/repositories/transaction_repository.dart';
import 'package:coin_master/shared/domain/usecases/base_usecases.dart';

class EditTransactionUseCase extends UseCase<Transaction, TransactionParam> {
  final TransactionRepository transactionRepository;

  EditTransactionUseCase({required this.transactionRepository});
  @override
  Future<Transaction> call(TransactionParam params) async {
    try {
      return await transactionRepository.editTransaction(
        transaction: params.transaction,
      );
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class TransactionParam extends Params {
  final Transaction transaction;
  TransactionParam({required this.transaction});

  @override
  List<Object?> get props => [transaction];
}
