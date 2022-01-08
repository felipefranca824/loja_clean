import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/product_repository_interface.dart';

class ProductRepository implements ProductRepositoryInterface {
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsFromCategory(
      {required CategoryEntity category}) {
    // TODO: implement getProductsFromCategory
    throw UnimplementedError();
  }
}
