import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/data/models/category_model.dart';
import 'package:loja_clean/app/modules/home/external/fakerapi/fakerapi_category_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late FakerapiCategoryDatasource datasource;

  setUp(() {
    dio = MockDio();
    datasource = FakerapiCategoryDatasource(client: dio);
  });

  test(
      'should return a list of CategoryModel when call getAllCategories datasource',
      () async {
    when(() => dio.get('https://fakestoreapi.com/products/categories'))
        .thenAnswer((_) async => Response(
            statusCode: 200,
            data: categories,
            requestOptions: RequestOptions(path: '')));

    final result = await datasource.getAllCategories();

    expect(result, isA<List<CategoryModel>>());
  });
}

const categories = [
  "electronics",
  "jewelery",
  "men's clothing",
  "women's clothing"
];
