// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NowPlaying)
final nowPlayingProvider = NowPlayingProvider._();

final class NowPlayingProvider
    extends $AsyncNotifierProvider<NowPlaying, List<Movie>> {
  NowPlayingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'nowPlayingProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$nowPlayingHash();

  @$internal
  @override
  NowPlaying create() => NowPlaying();
}

String _$nowPlayingHash() => r'b073b21aa917f86e3a252548c40faf0e48782a8f';

abstract class _$NowPlaying extends $AsyncNotifier<List<Movie>> {
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
