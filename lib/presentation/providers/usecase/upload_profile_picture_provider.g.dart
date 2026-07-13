// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_profile_picture_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(uploadProfilePicture)
final uploadProfilePictureProvider = UploadProfilePictureProvider._();

final class UploadProfilePictureProvider extends $FunctionalProvider<
    UploadProfilePicture,
    UploadProfilePicture,
    UploadProfilePicture> with $Provider<UploadProfilePicture> {
  UploadProfilePictureProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'uploadProfilePictureProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$uploadProfilePictureHash();

  @$internal
  @override
  $ProviderElement<UploadProfilePicture> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UploadProfilePicture create(Ref ref) {
    return uploadProfilePicture(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadProfilePicture value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadProfilePicture>(value),
    );
  }
}

String _$uploadProfilePictureHash() =>
    r'd4bf9009c7345fe6f29640f2dade1b9e90ca99ef';
