import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_clean/app/modules/home/data/models/category_model.dart';

import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';
import 'package:loja_clean/app/modules/home/presenter/home/stores/home_store.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key? key,
    required this.list,
    required this.controller,
  }) : super(key: key);
  final List<CategoryEntity> list;
  final HomeStore controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length + 1,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: index == 0
                    ? () {
                        controller.setListCategories();
                        controller.setCatgeorySeleccted(index);
                        print("${controller.categorySelected} index: $index");
                      }
                    : () {
                        controller.getProductsFromCategories(list[index - 1]);
                        controller.setCatgeorySeleccted(index);
                        print("${controller.categorySelected} index: $index");
                      },
                child: Observer(builder: (_) {
                  print('REFEZZZZZ');
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      index == 0 ? "New arrivals" : list[index - 1].name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: controller.categorySelected == index
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  );
                }),
              );
            }),
      ),
    );
  }
}
