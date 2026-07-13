// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieDetail)
final movieDetailProvider = MovieDetailFamily._();

final class MovieDetailProvider extends $FunctionalProvider<
        AsyncValue<MovieDetail?>, MovieDetail?, FutureOr<MovieDetail?>>
    with $FutureModifier<MovieDetail?>, $FutureProvider<MovieDetail?> {
  MovieDetailProvider._(
      {required MovieDetailFamily super.from, required Movie super.argument})
      : super(
          retry: null,
          name: r'movieDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$movieDetailHash();

  @override
  String toString() {
    return r'movieDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MovieDetail?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<MovieDetail?> create(Ref ref) {
    final argument = this.argument as Movie;
    return movieDetail(
      ref,
      movie: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieDetailHash() => r'77c45d8d304a403e4d0c0a7d7c815a881c377b2d';

final class MovieDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MovieDetail?>, Movie> {
  MovieDetailFamily._()
      : super(
          retry: null,
          name: r'movieDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MovieDetailProvider call({
    required Movie movie,
  }) =>
      MovieDetailProvider._(argument: movie, from: this);

  @override
  String toString() => r'movieDetailProvider';
}
