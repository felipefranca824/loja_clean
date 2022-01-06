import 'package:dartz/dartz.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';

abstract class ProductRepositoryInterface {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
