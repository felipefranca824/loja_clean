import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';

import 'button_add.dart';

class ItemList extends StatelessWidget {
  final int index;
  final String? discount;
  final ProductEntity product;
  const ItemList({
    Key? key,
    required this.index,
    this.discount,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(index);
        Modular.to.pushNamed('/details');
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: const BorderSide(width: 1, color: Colors.grey),
                right: index % 2 == 0
                    ? const BorderSide(width: 1, color: Colors.grey)
                    : BorderSide.none),
            shape: BoxShape.rectangle),
        height: 400,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: NetworkImage(product.image),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '\$ ${product.price}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: RichText(
                    text: TextSpan(
                      text: product.title,
                    ),
                  ),
                ),
              ],
            ),
            const ButtonAdd(),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                  height: 30,
                  width: 30,
                  child: const Icon(
                    Icons.bookmark_outline,
                    size: 30,
                  )),
            ),
            discount != null
                ? Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15)),
                        ),
                        height: 30,
                        width: 40,
                        child: Center(child: Text('-$discount%'))),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
