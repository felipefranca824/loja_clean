import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_clean/app/modules/home/data/models/category_model.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_all_products_usecase.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_products_from_category_usecase.dart';
import 'package:loja_clean/app/modules/home/presenter/states/home_state.dart';
import 'package:mobx/mobx.dart';

import 'package:loja_clean/app/modules/home/domain/usecases/get_all_categories_usecase.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  late GetAllProductsUsecase getAllProductsUsecase;
  late GetAllCategoriesUsecase getAllCategoriesUsecase;
  late GetProductsFromCategoryUsecase getProductsFromCategoryUsecase;
  HomeStoreBase() {
    getAllProductsUsecase = Modular.get<GetAllProductsUsecase>();
    getAllCategoriesUsecase = Modular.get<GetAllCategoriesUsecase>();
    getProductsFromCategoryUsecase =
        Modular.get<GetProductsFromCategoryUsecase>();
  }

  @observable
  List<ProductEntity> listProducts = [];

  @observable
  List<CategoryEntity> listCategories = [];

  @observable
  HomeState getAllProductsState = GetProductsStateInitial();

  @observable
  HomeState getAllCategoriesState = GetAllCategoriesStateInitial();

  @observable
  int categorySelected = 0;

  @action
  setCatgeorySeleccted(int value) {
    categorySelected = value;
  }

  @action
  setGetProductsState(HomeState state) {
    getAllProductsState = state;
  }

  @action
  setGetAllCategoriesState(HomeState state) {
    getAllCategoriesState = state;
  }

  @action
  Future<void> setListProducts() async {
    print("Comecou");
    setGetProductsState(GetProductsStateLoading());
    final list = await getAllProductsUsecase();
    list.fold(
        (l) => setGetProductsState(
            GetProductsStateError(error: 'Erro ao buscar produtos')), (r) {
      listProducts = r;
      setGetProductsState(GetProductsStateSucess(data: listProducts));
      print("terminou");
    });
  }

  @action
  Future<void> setListCategories() async {
    print("Comecou 1");
    setGetAllCategoriesState(GetAllCategoriesStateLoading());
    final list = await getAllCategoriesUsecase();
    list.fold(
        (l) => setGetAllCategoriesState(
            GetAllCategoriesStateError(error: 'Erro ao buscar produtos')), (r) {
      listCategories = r;
      print("terminou 2");
      setGetAllCategoriesState(
          GetAllCategoriesStateSucess(data: listCategories));
    });
  }

  Future<void> getProductsFromCategories(CategoryEntity category) async {
    setGetProductsState(GetProductsStateLoading());
    final list = await getProductsFromCategoryUsecase(category);

    list.fold(
        (l) => setGetProductsState(
            GetProductsStateError(error: 'Erro ao buscar produtos')), (r) {
      listProducts = r;
      setGetProductsState(GetProductsStateSucess(data: listProducts));
    });
  }
}
