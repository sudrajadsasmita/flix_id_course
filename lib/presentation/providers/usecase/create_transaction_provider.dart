import 'package:flix_id_course/domain/usecases/create_transaction/create_transaction.dart';
import 'package:flix_id_course/presentation/providers/repositories/transaction_repository_provider/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transaction_provider.g.dart';

@riverpod
CreateTransaction createTransaction(Ref ref) =>
    CreateTransaction(
        transactionRepository: ref.watch(transactionRepositoryProvider));
