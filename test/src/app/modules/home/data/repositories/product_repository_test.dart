import 'package:flutter_test/flutter_test.dart';
import 'package:loja_clean/app/modules/home/data/datasource/product_datasource_interface.dart';
import 'package:loja_clean/app/modules/home/data/repositories/product_repository.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late ProductRepository repository;
  late ProductDatasourceInterface datasource;

  setUp(() {
    repository = ProductRepository();
  });

  test('should return a list of ProductModel when call getAllProducts', () {});
}
