import 'package:loja_clean/app/modules/home/cores/exceptions/exceptions.dart';
import 'package:loja_clean/app/modules/home/data/datasource/product_datasource_interface.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/product_repository_interface.dart';

class ProductRepository implements ProductRepositoryInterface {
  final ProductDatasourceInterface datasource;

  ProductRepository({required this.datasource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final result = await datasource.getAllProducts();
      return Right(result);
    } on GetAllProductsException {
      return Left(ServerFailure(message: 'falha ao buscar dados'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    try {
      final result = await datasource.getProductById(id: id);
      return Right(result);
    } on GetProductByIdException {
      return Left(ServerFailure(message: "Falha ao buscar os dados"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsFromCategory(
      {required CategoryEntity category}) async {
    try {
      final result =
          await datasource.getProductsFromCategory(category: category);
      return Right(result);
    } on GetProductsFromCategoryException {
      return Left(ServerFailure(message: 'Falha ao buscar os dados'));
    }
  }
}
