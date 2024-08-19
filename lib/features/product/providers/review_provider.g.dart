// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncReviewNotifierHash() =>
    r'7bb2eb9292a273db02461049a90096c8ae8cbe70';

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

abstract class _$AsyncReviewNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<ReviewModel>> {
  late final int productId;

  FutureOr<List<ReviewModel>> build(
    int productId,
  );
}

/// See also [AsyncReviewNotifier].
@ProviderFor(AsyncReviewNotifier)
const asyncReviewNotifierProvider = AsyncReviewNotifierFamily();

/// See also [AsyncReviewNotifier].
class AsyncReviewNotifierFamily extends Family<AsyncValue<List<ReviewModel>>> {
  /// See also [AsyncReviewNotifier].
  const AsyncReviewNotifierFamily();

  /// See also [AsyncReviewNotifier].
  AsyncReviewNotifierProvider call(
    int productId,
  ) {
    return AsyncReviewNotifierProvider(
      productId,
    );
  }

  @override
  AsyncReviewNotifierProvider getProviderOverride(
    covariant AsyncReviewNotifierProvider provider,
  ) {
    return call(
      provider.productId,
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
  String? get name => r'asyncReviewNotifierProvider';
}

/// See also [AsyncReviewNotifier].
class AsyncReviewNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AsyncReviewNotifier, List<ReviewModel>> {
  /// See also [AsyncReviewNotifier].
  AsyncReviewNotifierProvider(
    int productId,
  ) : this._internal(
          () => AsyncReviewNotifier()..productId = productId,
          from: asyncReviewNotifierProvider,
          name: r'asyncReviewNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$asyncReviewNotifierHash,
          dependencies: AsyncReviewNotifierFamily._dependencies,
          allTransitiveDependencies:
              AsyncReviewNotifierFamily._allTransitiveDependencies,
          productId: productId,
        );

  AsyncReviewNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final int productId;

  @override
  FutureOr<List<ReviewModel>> runNotifierBuild(
    covariant AsyncReviewNotifier notifier,
  ) {
    return notifier.build(
      productId,
    );
  }

  @override
  Override overrideWith(AsyncReviewNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: AsyncReviewNotifierProvider._internal(
        () => create()..productId = productId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AsyncReviewNotifier,
      List<ReviewModel>> createElement() {
    return _AsyncReviewNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AsyncReviewNotifierProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AsyncReviewNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<ReviewModel>> {
  /// The parameter `productId` of this provider.
  int get productId;
}

class _AsyncReviewNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AsyncReviewNotifier,
        List<ReviewModel>> with AsyncReviewNotifierRef {
  _AsyncReviewNotifierProviderElement(super.provider);

  @override
  int get productId => (origin as AsyncReviewNotifierProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
