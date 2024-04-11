import 'package:flix_id_course/data/firebase/firebase_user_repository.dart';
import 'package:flix_id_course/data/repositories/transaction_repository.dart';
import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/entities/transaction.dart';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseTransactionRepository implements TransactionRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseTransactionRepository(
      {firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection('transactions');

    try {
      var balanceResult =
          await FirebaseUserRepository().getUserBalance(uuid: transaction.uuid);

      if (!balanceResult.isFailed) {
        int previousBalance = balanceResult.resultValue!;

        if (previousBalance - transaction.total >= 0) {
          await transactions.doc(transaction.id).set(transaction.toJson());

          var result = await transactions.doc(transaction.id).get();
          if (result.exists) {
            await FirebaseUserRepository().updateUserBalance(
                uuid: transaction.uuid,
                balance: previousBalance - transaction.total);
            return Result.success(Transaction.fromJson(result.data()!));
          } else {
            return Result.failed("Failed to create transaction data");
          }
        } else {
          return Result.failed("Insufficient balance");
        }
      } else {
        return Result.failed("Failed to create transaction data");
      }
    } catch (e) {
      return Result.failed("Failed to create transaction data");
    }
  }

  @override
  Future<Result<List<Transaction>>> getUserTransaction(
      {required String uuid}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection("transactions");
    try {
      var result = await transactions.where('uuid', isEqualTo: uuid).get();

      if (result.docs.isNotEmpty) {
        return Result.success(
            result.docs.map((e) => Transaction.fromJson(e.data())).toList());
      } else {
        return Result.success([]);
      }
    } catch (e) {
      return Result.failed("Failed to get User transaction");
    }
  }
}
