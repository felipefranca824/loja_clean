import 'package:dartz/dartz.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/category_repository_interface.dart';

abstract class GetAllCategoriesUsecaseInterface {
  Future<Either<Failure, List<CategoryEntity>>> call();
}

class GetAllCategoriesUsecase implements GetAllCategoriesUsecaseInterface {
  final CategoryRepositoryInterface repository;

  GetAllCategoriesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repository.getAllCategories();
  }
}
