// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(actors)
final actorsProvider = ActorsFamily._();

final class ActorsProvider extends $FunctionalProvider<AsyncValue<List<Actor>>,
        List<Actor>, FutureOr<List<Actor>>>
    with $FutureModifier<List<Actor>>, $FutureProvider<List<Actor>> {
  ActorsProvider._(
      {required ActorsFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'actorsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$actorsHash();

  @override
  String toString() {
    return r'actorsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Actor>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Actor>> create(Ref ref) {
    final argument = this.argument as int;
    return actors(
      ref,
      movieId: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ActorsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$actorsHash() => r'2ef01c31bc180d9bf2aedb35fd9c49158fca00ba';

final class ActorsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Actor>>, int> {
  ActorsFamily._()
      : super(
          retry: null,
          name: r'actorsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ActorsProvider call({
    required int movieId,
  }) =>
      ActorsProvider._(argument: movieId, from: this);

  @override
  String toString() => r'actorsProvider';
}
