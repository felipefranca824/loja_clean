import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_clean/app/modules/home/presenter/home/components/button_add.dart';

import 'package:loja_clean/app/modules/home/presenter/home/stores/home_store.dart';
import 'package:loja_clean/app/modules/home/presenter/states/home_state.dart';

import 'components/card_product.dart';
import 'components/list_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    controller.setListCategories();
    controller.setListProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.format_list_bulleted_sharp)],
        title: const Text('Zummedy'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(),
          Observer(builder: (_) {
            if (controller.getAllCategoriesState
                is GetAllCategoriesStateSucess) {
              final state = controller.getAllCategoriesState
                  as GetAllCategoriesStateSucess;

              return ListCategories(list: state.data);
            } else {
              return Container();
            }
          }),
          const Divider(),
          Observer(builder: (_) {
            if ((controller.getAllProductsState
                    is GetAllProductsStateLoading) ||
                (controller.getAllCategoriesState
                    is GetAllCategoriesStateLoading)) {
              print(controller.getAllCategoriesState);
              print(controller.getAllProductsState);
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.getAllProductsState
                is GetAllProductsStateError) {
              final state =
                  controller.getAllProductsState as GetAllProductsStateError;
              return Center(
                child: Text(state.error),
              );
            }
            final state =
                controller.getAllProductsState as GetAllProductsStateSucess;

            return Expanded(
              child: GridView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CardProduct(product: state.data[index]);
                  }),
            );
          }),
        ],
      ),
    );
  }
}
