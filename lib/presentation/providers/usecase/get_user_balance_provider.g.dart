// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_balance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserBalance)
final getUserBalanceProvider = GetUserBalanceProvider._();

final class GetUserBalanceProvider
    extends $FunctionalProvider<GetUserBalance, GetUserBalance, GetUserBalance>
    with $Provider<GetUserBalance> {
  GetUserBalanceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getUserBalanceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserBalanceHash();

  @$internal
  @override
  $ProviderElement<GetUserBalance> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUserBalance create(Ref ref) {
    return getUserBalance(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUserBalance value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUserBalance>(value),
    );
  }
}

String _$getUserBalanceHash() => r'de3d6de9458ecaecd671920e2f233dcc631e0e22';
