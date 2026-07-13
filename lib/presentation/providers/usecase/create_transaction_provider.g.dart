// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createTransaction)
final createTransactionProvider = CreateTransactionProvider._();

final class CreateTransactionProvider extends $FunctionalProvider<
    CreateTransaction,
    CreateTransaction,
    CreateTransaction> with $Provider<CreateTransaction> {
  CreateTransactionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'createTransactionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$createTransactionHash();

  @$internal
  @override
  $ProviderElement<CreateTransaction> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CreateTransaction create(Ref ref) {
    return createTransaction(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTransaction value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateTransaction>(value),
    );
  }
}

String _$createTransactionHash() => r'e7c1a0df6f260ba0289d1af833fd55517e3ca540';
