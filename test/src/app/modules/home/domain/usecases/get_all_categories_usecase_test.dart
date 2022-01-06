import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/category_repository_interface.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_all_categories_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockCategoryRepository extends Mock
    implements CategoryRepositoryInterface {}

void main() {
  late GetAllCategoriesUsecase usecase;
  late CategoryRepositoryInterface repository;

  setUp(() {
    repository = MockCategoryRepository();
    usecase = GetAllCategoriesUsecase(repository: repository);
  });

  const list = <CategoryEntity>[
    CategoryEntity(name: 'shoes'),
    CategoryEntity(name: 'shirts'),
  ];

  test('should return a List of CategoryEntity', () async {
    when(() => repository.getAllCategories()).thenAnswer(
        (_) async => const Right<Failure, List<CategoryEntity>>(list));

    final result = await usecase();

    expect(result, const Right(list));

    verify(() => repository.getAllCategories()).called(1);
  });

  test('should return a ServerFailure when call getAllCategories', () async {
    final failure = ServerFailure(message: 'falha ao buscar categorias');
    when(() => repository.getAllCategories())
        .thenAnswer((_) async => Left(failure));

    final result = await usecase();

    expect(result, Left(failure));

    verify(() => repository.getAllCategories()).called(1);
  });
}
