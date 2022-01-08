import 'package:equatable/equatable.dart';

class GetAllProductsException extends Equatable implements Exception {
  final String message;

  const GetAllProductsException({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}
