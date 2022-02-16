import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:loja_clean/app/modules/home/domain/entities/product_entity.dart';

import 'components/body.dart';

class DetailsProductPage extends StatelessWidget {
  const DetailsProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: Text(
                product.title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
              ),
            ),
          )
        ],
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
