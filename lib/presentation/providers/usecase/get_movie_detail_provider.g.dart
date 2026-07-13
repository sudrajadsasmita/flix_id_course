// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMovieDetail)
final getMovieDetailProvider = GetMovieDetailProvider._();

final class GetMovieDetailProvider
    extends $FunctionalProvider<GetMovieDetail, GetMovieDetail, GetMovieDetail>
    with $Provider<GetMovieDetail> {
  GetMovieDetailProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getMovieDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getMovieDetailHash();

  @$internal
  @override
  $ProviderElement<GetMovieDetail> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetMovieDetail create(Ref ref) {
    return getMovieDetail(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMovieDetail value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMovieDetail>(value),
    );
  }
}

String _$getMovieDetailHash() => r'e1b45b7dbd143e86b55ab5b5d1d25042fa9fde59';
