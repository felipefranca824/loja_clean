import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/data/datasource/product_datasource_interface.dart';
import 'package:loja_clean/app/modules/home/data/models/category_model.dart';
import 'package:loja_clean/app/modules/home/data/models/product_model.dart';
import 'package:loja_clean/app/modules/home/data/repositories/product_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockProductDatasource extends Mock implements ProductDatasourceInterface {
}

void main() {
  late ProductRepository repository;
  late ProductDatasourceInterface datasource;

  setUp(() {
    datasource = MockProductDatasource();
    repository = ProductRepository(datasource: datasource);
  });

  const list = <ProductModel>[
    ProductModel(
        id: 1,
        title: 'title',
        description: 'description',
        category: CategoryModel(name: 'teste'),
        price: 20,
        image: 'image'),
  ];

  test('should return a list of ProductModel when call getAllProducts',
      () async {
    when(() => datasource.getAllProducts()).thenAnswer((_) async => list);

    final result = await repository.getAllProducts();

    expect(result, const Right(list));

    verify(() => datasource.getAllProducts()).called(1);
  });
}
