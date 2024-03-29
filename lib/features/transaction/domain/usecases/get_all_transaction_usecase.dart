import 'package:coin_master/features/transaction/domain/entities/transaction_entity.dart';
import 'package:coin_master/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:coin_master/shared/domain/usecases/base_usecases.dart';

class GetAllTransactionsUseCase extends UseCase<List<TransactionEntity>, NoParams> {
  final TransactionRepository transactionRepository;

  GetAllTransactionsUseCase({required this.transactionRepository});
  @override
  Future<List<TransactionEntity>> call(NoParams params) async {
    try {
      return await transactionRepository.getAllTransactions();
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
