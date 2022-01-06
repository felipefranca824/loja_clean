import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_product_by_id_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepositoryInterface {
}

void main() {
  late GetProductByIdUsecase usecase;
  late ProductRepositoryInterface repository;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetProductByIdUsecase(repository: repository);
  });
  const id = 3;
  const product = ProductEntity(
      id: 1,
      title: 'teste',
      price: 2.0,
      category: CategoryEntity(name: 'shirts'),
      description: 'test description',
      image: 'https://image');

  test('should a ProductEntity when success', () async {
    when(() => repository.getProductById(id))
        .thenAnswer((_) async => const Right<Failure, ProductEntity>(product));

    final result = await usecase(id);

    expect(result, const Right(product));

    verify(() => repository.getProductById(id)).called(1);
  });

  test('should a ServerFailure when unsuccess', () async {
    final error = ServerFailure(message: 'falha ao buscar os dados');
    when(() => repository.getProductById(id))
        .thenAnswer((_) async => Left(error));

    final result = await usecase(id);

    expect(result, Left(error));

    verify(() => repository.getProductById(id)).called(1);
  });
}
