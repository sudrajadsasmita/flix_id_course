import 'package:flix_id_course/data/repositories/authentication.dart';
import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future<Result<void>> call(void params) {
    return _authentication.logout();
  }
}
