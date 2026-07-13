import 'package:flix_id_course/domain/usecases/logout/logout.dart';
import 'package:flix_id_course/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(Ref ref) =>
    Logout(authentication: ref.watch(authenticationProvider));
