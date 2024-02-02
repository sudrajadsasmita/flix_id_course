import 'package:flix_id_course/data/repositories/transaction_repository.dart';
import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/entities/transaction.dart';
import 'package:flix_id_course/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:flix_id_course/domain/usecases/usecase.dart';

class GetTransactions
    implements UseCase<Result<List<Transaction>>, GetTransactionsParam> {
  final TransactionRepository _transactionRepository;
  GetTransactions({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam params) async {
    var transactionListResult =
        await _transactionRepository.getUserTransaction(uuid: params.uuid);
    return switch (transactionListResult) {
      Success(value: final transactionResult) =>
        Result.success(transactionResult),
      Failed(:final message) => Result.failed(message),
    };
  }
}
