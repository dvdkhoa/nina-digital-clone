// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryProviderHash() => r'70c72eddfe44dec463995aa260cc6fc99b38a409';

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

abstract class _$CategoryProvider
    extends BuildlessAsyncNotifier<List<CategoryModel>> {
  late final int level;
  late final int id_parent;

  FutureOr<List<CategoryModel>> build({
    int level = 1,
    int id_parent = 0,
  });
}

/// See also [CategoryProvider].
@ProviderFor(CategoryProvider)
const categoryProviderProvider = CategoryProviderFamily();

/// See also [CategoryProvider].
class CategoryProviderFamily extends Family<AsyncValue<List<CategoryModel>>> {
  /// See also [CategoryProvider].
  const CategoryProviderFamily();

  /// See also [CategoryProvider].
  CategoryProviderProvider call({
    int level = 1,
    int id_parent = 0,
  }) {
    return CategoryProviderProvider(
      level: level,
      id_parent: id_parent,
    );
  }

  @override
  CategoryProviderProvider getProviderOverride(
    covariant CategoryProviderProvider provider,
  ) {
    return call(
      level: provider.level,
      id_parent: provider.id_parent,
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
  String? get name => r'categoryProviderProvider';
}

/// See also [CategoryProvider].
class CategoryProviderProvider
    extends AsyncNotifierProviderImpl<CategoryProvider, List<CategoryModel>> {
  /// See also [CategoryProvider].
  CategoryProviderProvider({
    int level = 1,
    int id_parent = 0,
  }) : this._internal(
          () => CategoryProvider()
            ..level = level
            ..id_parent = id_parent,
          from: categoryProviderProvider,
          name: r'categoryProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryProviderHash,
          dependencies: CategoryProviderFamily._dependencies,
          allTransitiveDependencies:
              CategoryProviderFamily._allTransitiveDependencies,
          level: level,
          id_parent: id_parent,
        );

  CategoryProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.level,
    required this.id_parent,
  }) : super.internal();

  final int level;
  final int id_parent;

  @override
  FutureOr<List<CategoryModel>> runNotifierBuild(
    covariant CategoryProvider notifier,
  ) {
    return notifier.build(
      level: level,
      id_parent: id_parent,
    );
  }

  @override
  Override overrideWith(CategoryProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryProviderProvider._internal(
        () => create()
          ..level = level
          ..id_parent = id_parent,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        level: level,
        id_parent: id_parent,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<CategoryProvider, List<CategoryModel>>
      createElement() {
    return _CategoryProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryProviderProvider &&
        other.level == level &&
        other.id_parent == id_parent;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, level.hashCode);
    hash = _SystemHash.combine(hash, id_parent.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryProviderRef on AsyncNotifierProviderRef<List<CategoryModel>> {
  /// The parameter `level` of this provider.
  int get level;

  /// The parameter `id_parent` of this provider.
  int get id_parent;
}

class _CategoryProviderProviderElement
    extends AsyncNotifierProviderElement<CategoryProvider, List<CategoryModel>>
    with CategoryProviderRef {
  _CategoryProviderProviderElement(super.provider);

  @override
  int get level => (origin as CategoryProviderProvider).level;
  @override
  int get id_parent => (origin as CategoryProviderProvider).id_parent;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
