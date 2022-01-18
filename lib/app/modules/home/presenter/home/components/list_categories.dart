import 'package:flutter/material.dart';

import 'package:loja_clean/app/modules/home/domain/entities/category_entity.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<CategoryEntity> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    list[index].name,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
