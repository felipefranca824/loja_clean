import 'package:dartz/dartz.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/product_repository_interface.dart';

abstract class GetProductByIdUsecaseInterface {
  Future<Either<Failure, ProductEntity>> call(int id);
}

class GetProductByIdUsecase implements GetProductByIdUsecaseInterface {
  final ProductRepositoryInterface repository;

  GetProductByIdUsecase({required this.repository});

  @override
  Future<Either<Failure, ProductEntity>> call(int id) async {
    return await repository.getProductById(id);
  }
}
