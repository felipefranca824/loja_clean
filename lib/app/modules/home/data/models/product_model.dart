import 'package:json_annotation/json_annotation.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';

import 'category_model.dart';

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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        price: json['price'],
        image: json['image']);
  }

  Map<String, dynamic> toJson(ProductModel object) {
    return <String, dynamic>{
      'id': object.id,
      'title': object.title,
      'description': object.description,
      'category': object.category,
      'price': object.price,
      'image': object.image,
    };
  }
}
