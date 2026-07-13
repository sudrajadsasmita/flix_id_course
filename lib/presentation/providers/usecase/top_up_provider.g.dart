// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topUp)
final topUpProvider = TopUpProvider._();

final class TopUpProvider extends $FunctionalProvider<TopUp, TopUp, TopUp>
    with $Provider<TopUp> {
  TopUpProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'topUpProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$topUpHash();

  @$internal
  @override
  $ProviderElement<TopUp> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TopUp create(Ref ref) {
    return topUp(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopUp value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopUp>(value),
    );
  }
}

String _$topUpHash() => r'e6414f907aaf0fe21990ecffbdffa902c228ea61';
