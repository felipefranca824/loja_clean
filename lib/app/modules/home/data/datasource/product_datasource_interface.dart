import '../models/product_model.dart';

abstract class ProductDatasourceInterface {
  Future<List<ProductModel>> getAllProducts();
}
