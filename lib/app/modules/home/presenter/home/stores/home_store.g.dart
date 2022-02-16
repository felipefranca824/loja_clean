// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$listProductsAtom = Atom(name: 'HomeStoreBase.listProducts');

  @override
  List<ProductEntity> get listProducts {
    _$listProductsAtom.reportRead();
    return super.listProducts;
  }

  @override
  set listProducts(List<ProductEntity> value) {
    _$listProductsAtom.reportWrite(value, super.listProducts, () {
      super.listProducts = value;
    });
  }

  final _$listCategoriesAtom = Atom(name: 'HomeStoreBase.listCategories');

  @override
  List<CategoryEntity> get listCategories {
    _$listCategoriesAtom.reportRead();
    return super.listCategories;
  }

  @override
  set listCategories(List<CategoryEntity> value) {
    _$listCategoriesAtom.reportWrite(value, super.listCategories, () {
      super.listCategories = value;
    });
  }

  final _$getAllProductsStateAtom =
      Atom(name: 'HomeStoreBase.getAllProductsState');

  @override
  HomeState get getAllProductsState {
    _$getAllProductsStateAtom.reportRead();
    return super.getAllProductsState;
  }

  @override
  set getAllProductsState(HomeState value) {
    _$getAllProductsStateAtom.reportWrite(value, super.getAllProductsState, () {
      super.getAllProductsState = value;
    });
  }

  final _$getAllCategoriesStateAtom =
      Atom(name: 'HomeStoreBase.getAllCategoriesState');

  @override
  HomeState get getAllCategoriesState {
    _$getAllCategoriesStateAtom.reportRead();
    return super.getAllCategoriesState;
  }

  @override
  set getAllCategoriesState(HomeState value) {
    _$getAllCategoriesStateAtom.reportWrite(value, super.getAllCategoriesState,
        () {
      super.getAllCategoriesState = value;
    });
  }

  final _$categorySelectedAtom = Atom(name: 'HomeStoreBase.categorySelected');

  @override
  int get categorySelected {
    _$categorySelectedAtom.reportRead();
    return super.categorySelected;
  }

  @override
  set categorySelected(int value) {
    _$categorySelectedAtom.reportWrite(value, super.categorySelected, () {
      super.categorySelected = value;
    });
  }

  final _$setListProductsAsyncAction =
      AsyncAction('HomeStoreBase.setListProducts');

  @override
  Future<void> setListProducts() {
    return _$setListProductsAsyncAction.run(() => super.setListProducts());
  }

  final _$setListCategoriesAsyncAction =
      AsyncAction('HomeStoreBase.setListCategories');

  @override
  Future<void> setListCategories() {
    return _$setListCategoriesAsyncAction.run(() => super.setListCategories());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic setCatgeorySeleccted(int value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCatgeorySeleccted');
    try {
      return super.setCatgeorySeleccted(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGetProductsState(HomeState state) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setGetProductsState');
    try {
      return super.setGetProductsState(state);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGetAllCategoriesState(HomeState state) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setGetAllCategoriesState');
    try {
      return super.setGetAllCategoriesState(state);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProducts: ${listProducts},
listCategories: ${listCategories},
getAllProductsState: ${getAllProductsState},
getAllCategoriesState: ${getAllCategoriesState},
categorySelected: ${categorySelected}
    ''';
  }
}
