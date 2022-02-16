import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';

abstract class HomeState {}

class GetProductsStateSucess implements HomeState {
  final List<ProductEntity> data;
  GetProductsStateSucess({
    required this.data,
  });
}

class GetProductsStateInitial implements HomeState {}

class GetProductsStateLoading implements HomeState {}

class GetProductsStateError implements HomeState {
  final String error;
  GetProductsStateError({
    required this.error,
  });
}

class GetAllCategoriesStateSucess implements HomeState {
  final List<CategoryEntity> data;
  GetAllCategoriesStateSucess({
    required this.data,
  });
}

class GetAllCategoriesStateInitial implements HomeState {}

class GetAllCategoriesStateLoading implements HomeState {}

class GetAllCategoriesStateError implements HomeState {
  final String error;
  GetAllCategoriesStateError({
    required this.error,
  });
}
