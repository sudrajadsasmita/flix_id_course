import 'package:flix_id_course/data/repositories/user_repository.dart';
import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/usecases/get_user_balance/get_user_balance_param.dart';
import 'package:flix_id_course/domain/usecases/usecase.dart';

class GetUserBalance implements UseCase<Result<int>, GetUserBalanceParam> {
  final UserRepository _userRepository;

  GetUserBalance({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<Result<int>> call(GetUserBalanceParam params) =>
      _userRepository.getUserBalance(uuid: params.userId);
}
