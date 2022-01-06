import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_products_from_category_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepositoryInterface {
}

void main() {
  late ProductRepositoryInterface repository;
  late GetProductsFromCategoryUsecase usecase;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetProductsFromCategoryUsecase(repository: repository);
  });

  const category = CategoryEntity(name: 'shoes');

  const list = <ProductEntity>[
    ProductEntity(
        id: 1,
        title: 'teste',
        price: 2.0,
        category: CategoryEntity(name: 'shirts'),
        description: 'test description',
        image: 'https://image'),
    ProductEntity(
        id: 2,
        title: 'teste 2',
        price: 3.0,
        category: CategoryEntity(name: 'shoes'),
        description: 'test description 2',
        image: 'https://image2'),
  ];

  test(
      'should return a list of ProductEntity when call GetProductsFromCategoryUsecase',
      () async {
    when(() => repository.getProductsFromCategory(category: category))
        .thenAnswer(
            (_) async => const Right<Failure, List<ProductEntity>>(list));

    final result = await usecase(category);

    expect(result, const Right(list));

    verify(() => repository.getProductsFromCategory(category: category))
        .called(1);
  });

  test(
      'should return a ServerFailure when call GetProductsFromCategoryUsecase unsuccess',
      () async {
    final error = ServerFailure(message: 'erro ao buscar dados da category');
    when(() => repository.getProductsFromCategory(category: category))
        .thenAnswer((_) async => Left(error));

    final result = await usecase(category);

    expect(result, Left(error));

    verify(() => repository.getProductsFromCategory(category: category))
        .called(1);
  });
}
