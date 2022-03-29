// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$categoriesAtom = Atom(name: '_HomeStoreBase.categories');

  @override
  List<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$productsAtom = Atom(name: '_HomeStoreBase.products');

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$filteredProductsAtom = Atom(name: '_HomeStoreBase.filteredProducts');

  @override
  List<ProductModel> get filteredProducts {
    _$filteredProductsAtom.reportRead();
    return super.filteredProducts;
  }

  @override
  set filteredProducts(List<ProductModel> value) {
    _$filteredProductsAtom.reportWrite(value, super.filteredProducts, () {
      super.filteredProducts = value;
    });
  }

  final _$categoryFilteredAtom = Atom(name: '_HomeStoreBase.categoryFiltered');

  @override
  String get categoryFiltered {
    _$categoryFilteredAtom.reportRead();
    return super.categoryFiltered;
  }

  @override
  set categoryFiltered(String value) {
    _$categoryFilteredAtom.reportWrite(value, super.categoryFiltered, () {
      super.categoryFiltered = value;
    });
  }

  final _$valueToFilterAtom = Atom(name: '_HomeStoreBase.valueToFilter');

  @override
  double get valueToFilter {
    _$valueToFilterAtom.reportRead();
    return super.valueToFilter;
  }

  @override
  set valueToFilter(double value) {
    _$valueToFilterAtom.reportWrite(value, super.valueToFilter, () {
      super.valueToFilter = value;
    });
  }

  final _$isFilteringAtom = Atom(name: '_HomeStoreBase.isFiltering');

  @override
  bool get isFiltering {
    _$isFilteringAtom.reportRead();
    return super.isFiltering;
  }

  @override
  set isFiltering(bool value) {
    _$isFilteringAtom.reportWrite(value, super.isFiltering, () {
      super.isFiltering = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$maxPriceAtom = Atom(name: '_HomeStoreBase.maxPrice');

  @override
  double get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(double value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic filterByPrice(double value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.filterByPrice');
    try {
      return super.filterByPrice(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getMaxPrice() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.getMaxPrice');
    try {
      return super.getMaxPrice();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic turnFilter() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.turnFilter');
    try {
      return super.turnFilter();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
products: ${products},
filteredProducts: ${filteredProducts},
categoryFiltered: ${categoryFiltered},
valueToFilter: ${valueToFilter},
isFiltering: ${isFiltering},
isLoading: ${isLoading},
maxPrice: ${maxPrice}
    ''';
  }
}
