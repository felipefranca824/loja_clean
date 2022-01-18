import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_clean/app/modules/home/data/repositories/category_repository.dart';
import 'package:loja_clean/app/modules/home/data/repositories/product_repository.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_all_categories_usecase.dart';
import 'package:loja_clean/app/modules/home/domain/usecases/get_all_products_usecase.dart';
import 'package:loja_clean/app/modules/home/external/fakerapi/fakerapi_category_datasource.dart';
import 'package:loja_clean/app/modules/home/external/fakerapi/fakerapi_product_datasource.dart';
import 'package:loja_clean/app/modules/home/presenter/details_product/details_product_page.dart';
import 'stores/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => Dio()),
    Bind.factory((i) => FakerapiProductDatasource(dio: i())),
    Bind.factory((i) => ProductRepository(datasource: i())),
    Bind.factory((i) => GetAllProductsUsecase(repository: i())),
    Bind.factory((i) => FakerapiCategoryDatasource(client: i())),
    Bind.factory((i) => CategoryRepository(datasource: i())),
    Bind.factory((i) => GetAllCategoriesUsecase(repository: i())),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/details', child: (_, args) => const DetailsProductPage()),
  ];
}
