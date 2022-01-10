import 'package:loja_clean/app/modules/home/data/models/category_model.dart';

abstract class CategoryDatasourceInterface {
  Future<List<CategoryModel>> getAllCategories();
}
