import 'package:equatable/equatable.dart';
import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final CategoryEntity category;
  final String description;
  final String image;

  const ProductEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image});

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        category,
        description,
        image,
      ];
}
