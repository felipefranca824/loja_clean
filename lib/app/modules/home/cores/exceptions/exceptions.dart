import 'package:equatable/equatable.dart';

class GetAllProductsException extends Equatable implements Exception {
  final String message;

  const GetAllProductsException({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}

class GetProductByIdException extends Equatable implements Exception {
  final String message;

  const GetProductByIdException({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}

class GetProductsFromCategoryException extends Equatable implements Exception {
  final String message;

  const GetProductsFromCategoryException({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}

class GetAllCategoriesException extends Equatable implements Exception {
  final String message;

  const GetAllCategoriesException({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}
