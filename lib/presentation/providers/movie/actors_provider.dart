import 'package:flix_id_course/domain/entities/actor.dart';
import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/usecases/get_actors/get_actors.dart';
import 'package:flix_id_course/domain/usecases/get_actors/get_actors_param.dart';
import 'package:flix_id_course/presentation/providers/usecase/get_actors_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(Ref ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);

  var actorsResult = await getActors(GetActorsParam(movieId: movieId));

  return switch (actorsResult) {
    Success(value: final actors) => actors,
    Failed(message: _) => const []
  };
}
