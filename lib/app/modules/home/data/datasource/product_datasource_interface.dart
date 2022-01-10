import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import '../models/product_model.dart';

abstract class ProductDatasourceInterface {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById({required int id});
  Future<List<ProductModel>> getProductsFromCategory(
      {required CategoryEntity category});
}
