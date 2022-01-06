import 'package:dartz/dartz.dart';

import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/product_repository_interface.dart';

abstract class GetAllProductsUsecaseInterface {
  Future<Either<Failure, List<ProductEntity>>> call();
}

class GetAllProductsUsecase implements GetAllProductsUsecaseInterface {
  ProductRepositoryInterface repository;
  GetAllProductsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getAllProducts();
  }
}
