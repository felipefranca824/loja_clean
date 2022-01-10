import 'package:dartz/dartz.dart';
import 'package:loja_clean/app/modules/home/cores/exceptions/exceptions.dart';

import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/data/datasource/category_datasource_interface.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/domain/repositories/category_repository_interface.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final CategoryDatasourceInterface datasource;
  CategoryRepository({
    required this.datasource,
  });
  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final result = await datasource.getAllCategories();
      return Right(result);
    } on GetAllCategoriesException {
      return Left(ServerFailure(message: 'falha ao buscar os dados'));
    }
  }
}
