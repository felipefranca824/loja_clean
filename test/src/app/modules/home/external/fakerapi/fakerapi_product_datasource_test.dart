import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/data/models/category_model.dart';
import 'package:loja_clean/app/modules/home/data/models/product_model.dart';
import 'package:loja_clean/app/modules/home/external/fakerapi/fakerapi_product_datasource.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late FakerapiProductDatasource datasource;
  late Dio dio;
  setUp(() {
    dio = DioMock();
    datasource = FakerapiProductDatasource(dio: dio);
  });

  test(
      'should return a list of ProductModel when call getAllProducts datasource',
      () async {
    when(() => dio.get("https://fakestoreapi.com/products")).thenAnswer(
        (_) async => Response(
            data: jsonDecode(allProducts),
            statusCode: 200,
            requestOptions: RequestOptions(path: '')));

    final result = await datasource.getAllProducts();

    expect(result, isA<List<ProductModel>>());
  });

  test('should return a ProductModel when call getProductById datasource',
      () async {
    when(() => dio.get('https://fakestoreapi.com/products/2')).thenAnswer(
        (_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(path: 'https:/com/products/2'),
            data: jsonDecode(product)));

    final result = await datasource.getProductById(id: 2);

    expect(result, isA<ProductModel>());
  });

  test(
      'should return a list of ProductModel when call getProductsFromCategroy datasource',
      () async {
    when(() => dio.get('https://fakestoreapi.com/products/category/shirts'))
        .thenAnswer((_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
            data: jsonDecode(allProducts)));

    final result = await datasource.getProductsFromCategory(
        category: const CategoryModel(name: 'shirts'));

    expect(result, isA<List<ProductModel>>());
  });
}

const product = ''' {
        "id": "1",
        "title": "teste",
        "price": "20",
        "category": "shirts",
        "description": "teste",
        "image": "http://teste2.png"
    }''';

const allProducts = ''' 
  [
    {
        "id": "1",
        "title": "teste",
        "price": "20",
        "category": "shirts",
        "description": "teste",
        "image": "http://teste2.png"
    },
    {
        "id": "2",
        "title": "teste2",
        "price": "202",
        "category": "shirts",
        "description": "teste2",
        "image": "http://teste3.png"
    }
]
  ''';
