import 'package:flix_id_course/domain/usecases/register/register.dart';
import 'package:flix_id_course/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:flix_id_course/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register(Ref ref) => Register(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
