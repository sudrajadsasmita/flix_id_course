// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionData)
final transactionDataProvider = TransactionDataProvider._();

final class TransactionDataProvider
    extends $AsyncNotifierProvider<TransactionData, List<Transaction>> {
  TransactionDataProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'transactionDataProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$transactionDataHash();

  @$internal
  @override
  TransactionData create() => TransactionData();
}

String _$transactionDataHash() => r'cfa009383284bb9dbee5f4e2e863395a6ab9d59e';

abstract class _$TransactionData extends $AsyncNotifier<List<Transaction>> {
  FutureOr<List<Transaction>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Transaction>>, List<Transaction>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Transaction>>, List<Transaction>>,
        AsyncValue<List<Transaction>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
