import 'package:dartz/dartz.dart';
import 'package:loja_clean/app/modules/home/cores/failures/failures.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';

abstract class CategoryRepositoryInterface {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}
