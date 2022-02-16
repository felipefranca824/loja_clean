import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';

import 'button_add.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/details', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(color: Colors.grey, width: 1),
              bottom: BorderSide(color: Colors.grey, width: 1),
            )),
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(product.image),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20))),
                      child: const Center(child: Text('15%')),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.only(top: 10, right: 8),
                          child: const Icon(
                            Icons.bookmark_outline_outlined,
                            size: 30,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                  child: Text(
                    "\$ ${product.price}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: ButtonAdd(),
          ),
        ],
      ),
    );
  }
}
