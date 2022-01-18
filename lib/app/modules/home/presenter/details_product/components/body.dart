import 'package:flutter/material.dart';

import 'container_color.dart';
import 'indicator_images.dart';
import 'row_colors.dart';
import 'row_sizes.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          alignment: Alignment.center,
          child: PageView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 300,
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Image.network(
                      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                      fit: BoxFit.scaleDown,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        height: 300,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 300,
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Image.network(
                      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                      fit: BoxFit.scaleDown,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        height: 300,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const IndicatorImages(quantifyImages: 3, imageSelected: 0),
        const SizedBox(
          height: 30,
        ),
        const RowSizes(),
        const SizedBox(
          height: 20,
        ),
        const RowColors(),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Composition:',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '100% Silk',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Price:',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '\$ 349.99',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: Colors.red),
              ],
              color: Colors.red,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20)),
            ),
            child: const Center(
              child: Text(
                'Add to basket',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
