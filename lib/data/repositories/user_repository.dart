import 'dart:io';

import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uuid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  Future<Result<User>> getUser({
    required String uuid,
  });

  Future<Result<User>> updateUser({
    required User user,
  });

  Future<Result<int>> getUserBalance({
    required String uuid,
  });

  Future<Result<User>> updateUserBalance({
    required String uuid,
    required int balance,
  });

  Future<Result<User>> uploadProfilePicture({
    required User user,
    required File imageFile,
  });
}
