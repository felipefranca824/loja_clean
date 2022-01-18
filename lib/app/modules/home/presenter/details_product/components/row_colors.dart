import 'package:flutter/material.dart';

import 'container_color.dart';

class RowColors extends StatelessWidget {
  const RowColors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Color:',
            style: TextStyle(fontSize: 18.0),
          ),
          Row(
            children: const [
              ContainerColor(
                isSelected: true,
                color: Colors.black,
              ),
              ContainerColor(
                isSelected: false,
                color: Colors.pink,
              ),
              ContainerColor(
                isSelected: false,
                color: Colors.yellow,
              ),
              ContainerColor(
                isSelected: false,
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
