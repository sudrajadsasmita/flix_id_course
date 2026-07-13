// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authentication)
final authenticationProvider = AuthenticationProvider._();

final class AuthenticationProvider
    extends $FunctionalProvider<Authentication, Authentication, Authentication>
    with $Provider<Authentication> {
  AuthenticationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authenticationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authenticationHash();

  @$internal
  @override
  $ProviderElement<Authentication> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Authentication create(Ref ref) {
    return authentication(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Authentication value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Authentication>(value),
    );
  }
}

String _$authenticationHash() => r'1f395f3da3a40582a51a283874d53471830ecd4d';
