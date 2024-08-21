// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewFilterHash() => r'388c628016fed7ee71b4b815ecf11388032f818e';

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

abstract class _$ReviewFilter
    extends BuildlessAutoDisposeNotifier<List<ReviewModel>> {
  late final int productId;

  List<ReviewModel> build(
    int productId,
  );
}

/// See also [ReviewFilter].
@ProviderFor(ReviewFilter)
const reviewFilterProvider = ReviewFilterFamily();

/// See also [ReviewFilter].
class ReviewFilterFamily extends Family<List<ReviewModel>> {
  /// See also [ReviewFilter].
  const ReviewFilterFamily();

  /// See also [ReviewFilter].
  ReviewFilterProvider call(
    int productId,
  ) {
    return ReviewFilterProvider(
      productId,
    );
  }

  @override
  ReviewFilterProvider getProviderOverride(
    covariant ReviewFilterProvider provider,
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
  String? get name => r'reviewFilterProvider';
}

/// See also [ReviewFilter].
class ReviewFilterProvider
    extends AutoDisposeNotifierProviderImpl<ReviewFilter, List<ReviewModel>> {
  /// See also [ReviewFilter].
  ReviewFilterProvider(
    int productId,
  ) : this._internal(
          () => ReviewFilter()..productId = productId,
          from: reviewFilterProvider,
          name: r'reviewFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reviewFilterHash,
          dependencies: ReviewFilterFamily._dependencies,
          allTransitiveDependencies:
              ReviewFilterFamily._allTransitiveDependencies,
          productId: productId,
        );

  ReviewFilterProvider._internal(
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
  List<ReviewModel> runNotifierBuild(
    covariant ReviewFilter notifier,
  ) {
    return notifier.build(
      productId,
    );
  }

  @override
  Override overrideWith(ReviewFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReviewFilterProvider._internal(
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
  AutoDisposeNotifierProviderElement<ReviewFilter, List<ReviewModel>>
      createElement() {
    return _ReviewFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReviewFilterProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReviewFilterRef on AutoDisposeNotifierProviderRef<List<ReviewModel>> {
  /// The parameter `productId` of this provider.
  int get productId;
}

class _ReviewFilterProviderElement
    extends AutoDisposeNotifierProviderElement<ReviewFilter, List<ReviewModel>>
    with ReviewFilterRef {
  _ReviewFilterProviderElement(super.provider);

  @override
  int get productId => (origin as ReviewFilterProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
