import 'package:coin_master/features/transaction/domain/entities/transaction_entity.dart';
import 'package:coin_master/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:coin_master/shared/domain/usecases/base_usecases.dart';

class DeleteTransactionUseCase extends UseCase<void, TransactionParam> {
  final TransactionRepository transactionRepository;

  DeleteTransactionUseCase({required this.transactionRepository});
  @override
  Future<void> call(TransactionParam params) async {
    try {
      return await transactionRepository.deleteTransaction(
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
  final TransactionEntity transaction;
  TransactionParam({required this.transaction});

  @override
  List<Object?> get props => [transaction];
}
