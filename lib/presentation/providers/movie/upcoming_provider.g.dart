// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpComing)
final upComingProvider = UpComingProvider._();

final class UpComingProvider
    extends $AsyncNotifierProvider<UpComing, List<Movie>> {
  UpComingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'upComingProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$upComingHash();

  @$internal
  @override
  UpComing create() => UpComing();
}

String _$upComingHash() => r'e0dd53e3c7acf00fe5be35295163631466b02ab4';

abstract class _$UpComing extends $AsyncNotifier<List<Movie>> {
  FutureOr<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Movie>>, List<Movie>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Movie>>, List<Movie>>,
        AsyncValue<List<Movie>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
