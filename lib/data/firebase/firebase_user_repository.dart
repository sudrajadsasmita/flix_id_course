import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flix_id_course/data/repositories/user_repository.dart';
import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/entities/user.dart';
import 'package:path/path.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<User>> createUser({
    required String uuid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  }) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection('users');

    await users.doc(uuid).set({
      'uuid': uuid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'balance': balance,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uuid).get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return Result.failed("Failed to create User data");
    }
  }

  @override
  Future<Result<User>> getUser({required String uuid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("users/$uuid");

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return Result.failed("User not found");
    }
  }

  @override
  Future<Result<int>> getUserBalance({required String uuid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('users/${uuid}');
    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();
    if (result.exists) {
      return Result.success(result.data()!["balance"]);
    } else {
      return Result.failed("User not found");
    }
  }

  @override
  Future<Result<User>> updateUser({required User user}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firebaseFirestore.doc('users/${user.uuid}');
      await documentReference.update(user.toJson());

      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();
      if (result.exists) {
        User updatedUser = User.fromJson(result.data()!);
        if (updatedUser == user) {
          return Result.success(updatedUser);
        } else {
          return Result.failed("Failed to update User data");
        }
      } else {
        return Result.failed("Failed to update User data");
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? "Failed to update User data");
    }
  }

  @override
  Future<Result<User>> updateUserBalance(
      {required String uuid, required int balance}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("users/${uuid}");
    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();
    if (result.exists) {
      await documentReference.update({"balance": balance});

      DocumentSnapshot<Map<String, dynamic>> updateResult =
          await documentReference.get();
      if (updateResult.exists) {
        User updatedUser = User.fromJson(updateResult.data()!);
        if (updatedUser.balance == balance) {
          return Result.success(updatedUser);
        } else {
          return Result.failed("Failed to updated user balance");
        }
      } else {
        return Result.failed("Failed to retrieve updated user balance");
      }
    } else {
      return Result.failed("User not found");
    }
  }

  @override
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile}) async {
    String fileName = basename(imageFile.path);
    Reference reference = FirebaseStorage.instance.ref().child(fileName);

    try {
      await reference.putFile(imageFile);
      String downloadUrl = await reference.getDownloadURL();
      var updateResult =
          await updateUser(user: user.copyWith(photoUrl: downloadUrl));

      if (updateResult.isSuccess) {
        return Result.success(updateResult.resultValue!);
      } else {
        return Result.failed(updateResult.errorMessage!);
      }
    } catch (e) {
      return Result.failed("Failed to update profile picture");
    }
  }
}
