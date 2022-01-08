import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required String name,
  }) : super(name: name);
}
