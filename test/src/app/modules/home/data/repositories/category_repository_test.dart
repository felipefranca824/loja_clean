import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/data/datasource/category_datasource_interface.dart';
import 'package:loja_clean/app/modules/home/data/models/category_model.dart';
import 'package:loja_clean/app/modules/home/data/repositories/category_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockCategoryDatasource extends Mock
    implements CategoryDatasourceInterface {}

void main() {
  late CategoryRepository repository;
  late CategoryDatasourceInterface datasource;

  setUp(() {
    datasource = MockCategoryDatasource();
    repository = CategoryRepository(datasource: datasource);
  });

  const list = <CategoryModel>[
    CategoryModel(name: 'shirts'),
  ];

  test('should return a list of CategoryModel when call GetAllCAtegories',
      () async {
    when(() => datasource.getAllCategories()).thenAnswer((_) async => list);

    final result = await repository.getAllCategories();

    expect(result, const Right(list));

    verify(() => datasource.getAllCategories()).called(1);
  });
}
