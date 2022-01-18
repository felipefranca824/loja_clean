import 'package:flutter/material.dart';

import 'size_number.dart';

class RowSizes extends StatelessWidget {
  const RowSizes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      height: 70,
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(style: BorderStyle.solid, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Sizes (US)',
              style: TextStyle(
                fontSize: 18,
              )),
          Row(
            children: const [
              SizeNumber(size: 4),
              SizeNumber(size: 6),
              SizeNumber(size: 8),
            ],
          ),
        ],
      ),
    );
  }
}
