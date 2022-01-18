import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_clean/app/modules/home/data/models/category_model.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_all_products_usecase.dart';
import 'package:loja_clean/app/modules/home/presenter/states/home_state.dart';
import 'package:mobx/mobx.dart';

import 'package:loja_clean/app/modules/home/domain/usecases/get_all_categories_usecase.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  late GetAllProductsUsecase getAllProductsUsecase;
  late GetAllCategoriesUsecase getAllCategoriesUsecase;
  HomeStoreBase() {
    getAllProductsUsecase = Modular.get<GetAllProductsUsecase>();
    getAllCategoriesUsecase = Modular.get<GetAllCategoriesUsecase>();
  }

  @observable
  List<ProductEntity> listProducts = [];

  @observable
  List<CategoryEntity> listCategories = [];

  @observable
  HomeState getAllProductsState = GetAllProductsStateInitial();

  @observable
  HomeState getAllCategoriesState = GetAllCategoriesStateInitial();

  @action
  setGetAllProductsState(HomeState state) {
    getAllProductsState = state;
  }

  @action
  setGetAllCategoriesState(HomeState state) {
    getAllCategoriesState = state;
  }

  @action
  Future<void> setListProducts() async {
    print("Comecou");
    setGetAllProductsState(GetAllProductsStateLoading());
    final list = await getAllProductsUsecase();
    list.fold(
        (l) => setGetAllProductsState(
            GetAllProductsStateError(error: 'Erro ao buscar produtos')), (r) {
      listProducts = r;
      setGetAllProductsState(GetAllProductsStateSucess(data: listProducts));
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
}
