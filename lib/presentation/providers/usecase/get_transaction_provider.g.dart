// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTransactions)
final getTransactionsProvider = GetTransactionsProvider._();

final class GetTransactionsProvider extends $FunctionalProvider<GetTransactions,
    GetTransactions, GetTransactions> with $Provider<GetTransactions> {
  GetTransactionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getTransactionsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getTransactionsHash();

  @$internal
  @override
  $ProviderElement<GetTransactions> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetTransactions create(Ref ref) {
    return getTransactions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTransactions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTransactions>(value),
    );
  }
}

String _$getTransactionsHash() => r'9f7ef18c81036e0b76d6ee0e11ffaf599403b85d';
