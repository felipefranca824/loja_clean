import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';

abstract class HomeState {}

class GetAllProductsStateSucess implements HomeState {
  final List<ProductEntity> data;
  GetAllProductsStateSucess({
    required this.data,
  });
}

class GetAllProductsStateInitial implements HomeState {}

class GetAllProductsStateLoading implements HomeState {}

class GetAllProductsStateError implements HomeState {
  final String error;
  GetAllProductsStateError({
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
