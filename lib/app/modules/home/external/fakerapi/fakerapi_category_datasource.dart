import 'package:dio/dio.dart';
import 'package:loja_clean/app/modules/home/cores/exceptions/exceptions.dart';
import 'package:loja_clean/app/modules/home/data/datasource/category_datasource_interface.dart';
import 'package:loja_clean/app/modules/home/data/models/category_model.dart';

class FakerapiCategoryDatasource implements CategoryDatasourceInterface {
  final Dio client;
  FakerapiCategoryDatasource({
    required this.client,
  });
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final result =
        await client.get('https://fakestoreapi.com/products/categories');

    if (result.statusCode == 200) {
      final jsonList = result.data as List;
      final list = jsonList.map((json) => CategoryModel(name: json)).toList();
      return list;
    } else {
      throw const GetAllCategoriesException(
          message: 'Falha ao buscar as categorias');
    }
  }
}
