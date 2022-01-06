import 'package:dartz/dartz.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/product_repository_interface.dart';

abstract class GetProductsFromCategoryUsecaseInterface {
  Future<Either<Failure, List<ProductEntity>>> call(CategoryEntity category);
}

class GetProductsFromCategoryUsecase
    implements GetProductsFromCategoryUsecaseInterface {
  final ProductRepositoryInterface repository;

  GetProductsFromCategoryUsecase({required this.repository});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      CategoryEntity category) async {
    return await repository.getProductsFromCategory(category: category);
  }
}
