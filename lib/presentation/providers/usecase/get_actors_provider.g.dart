// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_actors_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getActors)
final getActorsProvider = GetActorsProvider._();

final class GetActorsProvider
    extends $FunctionalProvider<GetActors, GetActors, GetActors>
    with $Provider<GetActors> {
  GetActorsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getActorsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getActorsHash();

  @$internal
  @override
  $ProviderElement<GetActors> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetActors create(Ref ref) {
    return getActors(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetActors value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetActors>(value),
    );
  }
}

String _$getActorsHash() => r'ef9c5268885e9dd4da47012c32c55eb02a44b19b';
