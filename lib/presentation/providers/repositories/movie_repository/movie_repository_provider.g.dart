// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieRepository)
final movieRepositoryProvider = MovieRepositoryProvider._();

final class MovieRepositoryProvider extends $FunctionalProvider<MovieRepository,
    MovieRepository, MovieRepository> with $Provider<MovieRepository> {
  MovieRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'movieRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$movieRepositoryHash();

  @$internal
  @override
  $ProviderElement<MovieRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MovieRepository create(Ref ref) {
    return movieRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MovieRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MovieRepository>(value),
    );
  }
}

String _$movieRepositoryHash() => r'992170f08015969dc798d07ee319270dcba0bc13';
