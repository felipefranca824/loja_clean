import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_all_products_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepositoryInterface {
}

void main() {
  late GetAllProductsUsecaseInterface usecase;
  late ProductRepositoryInterface repository;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetAllProductsUsecase(repository: repository);
  });

  const list = <ProductEntity>[
    ProductEntity(
        id: 1,
        title: 'teste',
        price: 2.0,
        category: 'shoes',
        description: 'test description',
        image: 'https://image'),
    ProductEntity(
        id: 2,
        title: 'teste 2',
        price: 3.0,
        category: 'shirts',
        description: 'test description 2',
        image: 'https://image2'),
  ];

  test('should return a list of ProductEntity when call getAllProducts',
      () async {
    when(() => repository.getAllProducts()).thenAnswer(
        (_) async => const Right<Failure, List<ProductEntity>>(list));

    final result = await usecase();

    expect(result, const Right(list));

    verify(() => repository.getAllProducts()).called(1);
  });

  test('should return a Failure when call unsuccess', () async {
    final error = ServerFailure(message: 'falha ao buscar os dados');
    when(() => repository.getAllProducts())
        .thenAnswer((_) async => Left(error));

    final result = await usecase();

    expect(result, Left(error));

    verify(() => repository.getAllProducts()).called(1);
  });
}
