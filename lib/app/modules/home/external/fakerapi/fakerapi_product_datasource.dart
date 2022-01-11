import 'package:dio/dio.dart';
import 'package:loja_clean/app/modules/home/cores/exceptions/exceptions.dart';

import 'package:loja_clean/app/modules/home/data/datasource/product_datasource_interface.dart';
import 'package:loja_clean/app/modules/home/data/models/product_model.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';

class FakerapiProductDatasource implements ProductDatasourceInterface {
  final Dio dio;
  FakerapiProductDatasource({
    required this.dio,
  });
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final result = await dio.get('https://fakestoreapi.com/products');

    if (result.statusCode == 200) {
      final jsonList = result.data as List;
      final list = jsonList.map((json) => ProductModel.fromJson(json)).toList();

      return list;
    } else {
      throw const GetAllProductsException(message: 'Erro ao buscar produtos');
    }
  }

  @override
  Future<ProductModel> getProductById({required int id}) async {
    final result = await dio.get('https://fakestoreapi.com/products/$id');
    if (result.statusCode == 200) {
      return ProductModel.fromJson(result.data);
    } else {
      throw const GetProductByIdException(
          message: "Falha ao buscar esse produto");
    }
  }

  @override
  Future<List<ProductModel>> getProductsFromCategory(
      {required CategoryEntity category}) async {
    final result = await dio
        .get('https://fakestoreapi.com/products/category/${category.name}');
    print(result.data);
    if (result.statusCode == 200) {
      final jsonList = result.data as List;
      final list = jsonList.map((json) => ProductModel.fromJson(json)).toList();

      return list;
    } else {
      throw const GetProductsFromCategoryException(
          message: 'Falha ao buscar produtos');
    }
  }
}
