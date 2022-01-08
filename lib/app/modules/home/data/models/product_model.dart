import 'package:json_annotation/json_annotation.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';

import 'category_model.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  const ProductModel({
    required int id,
    required String title,
    required String description,
    required CategoryModel category,
    required double price,
    required String image,
  }) : super(
            id: id,
            title: title,
            description: description,
            category: category,
            price: price,
            image: image);
}
