// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMovieList)
final getMovieListProvider = GetMovieListProvider._();

final class GetMovieListProvider
    extends $FunctionalProvider<GetMovieList, GetMovieList, GetMovieList>
    with $Provider<GetMovieList> {
  GetMovieListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getMovieListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getMovieListHash();

  @$internal
  @override
  $ProviderElement<GetMovieList> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetMovieList create(Ref ref) {
    return getMovieList(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMovieList value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMovieList>(value),
    );
  }
}

String _$getMovieListHash() => r'b495de3d77d672d60d5e2ed4955c3967acb0ba1e';
