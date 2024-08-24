// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_keyword_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncOldKeywordHash() => r'f4e166fe08df5b7a03c53b169f3547afccc2172a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AsyncOldKeyword
    extends BuildlessAutoDisposeAsyncNotifier<List<OldSearch?>> {
  late final dynamic userId;

  FutureOr<List<OldSearch?>> build(
    dynamic userId,
  );
}

/// See also [AsyncOldKeyword].
@ProviderFor(AsyncOldKeyword)
const asyncOldKeywordProvider = AsyncOldKeywordFamily();

/// See also [AsyncOldKeyword].
class AsyncOldKeywordFamily extends Family<AsyncValue<List<OldSearch?>>> {
  /// See also [AsyncOldKeyword].
  const AsyncOldKeywordFamily();

  /// See also [AsyncOldKeyword].
  AsyncOldKeywordProvider call(
    dynamic userId,
  ) {
    return AsyncOldKeywordProvider(
      userId,
    );
  }

  @override
  AsyncOldKeywordProvider getProviderOverride(
    covariant AsyncOldKeywordProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'asyncOldKeywordProvider';
}

/// See also [AsyncOldKeyword].
class AsyncOldKeywordProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AsyncOldKeyword, List<OldSearch?>> {
  /// See also [AsyncOldKeyword].
  AsyncOldKeywordProvider(
    dynamic userId,
  ) : this._internal(
          () => AsyncOldKeyword()..userId = userId,
          from: asyncOldKeywordProvider,
          name: r'asyncOldKeywordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$asyncOldKeywordHash,
          dependencies: AsyncOldKeywordFamily._dependencies,
          allTransitiveDependencies:
              AsyncOldKeywordFamily._allTransitiveDependencies,
          userId: userId,
        );

  AsyncOldKeywordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final dynamic userId;

  @override
  FutureOr<List<OldSearch?>> runNotifierBuild(
    covariant AsyncOldKeyword notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(AsyncOldKeyword Function() create) {
    return ProviderOverride(
      origin: this,
      override: AsyncOldKeywordProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AsyncOldKeyword, List<OldSearch?>>
      createElement() {
    return _AsyncOldKeywordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AsyncOldKeywordProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AsyncOldKeywordRef
    on AutoDisposeAsyncNotifierProviderRef<List<OldSearch?>> {
  /// The parameter `userId` of this provider.
  dynamic get userId;
}

class _AsyncOldKeywordProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AsyncOldKeyword,
        List<OldSearch?>> with AsyncOldKeywordRef {
  _AsyncOldKeywordProviderElement(super.provider);

  @override
  dynamic get userId => (origin as AsyncOldKeywordProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
