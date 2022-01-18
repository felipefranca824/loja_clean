import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/body.dart';

class DetailsProductPage extends StatelessWidget {
  const DetailsProductPage({Key? key}) : super(key: key);

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Center(
              child: Text(
                'Mochila Normal',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
              ),
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}
