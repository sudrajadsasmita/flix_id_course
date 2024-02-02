import 'dart:io';

import 'package:flix_id_course/data/repositories/user_repository.dart';
import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/entities/user.dart';

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<User>> createUser(
      {required String uuid,
      required String email,
      required String name,
      String? photoUrl,
      int balance = 0}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUser({required String uuid}) async {
    await Future.delayed(Duration(seconds: 1));
    return Result.success(
        User(uuid: uuid, email: "dummy@dummy.com", name: "dummy"));
  }

  @override
  Future<Result<int>> getUserBalance({required String uuid}) {
    // TODO: implement getUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserBalance(
      {required String uuid, required int balance}) {
    // TODO: implement updateUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile}) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
