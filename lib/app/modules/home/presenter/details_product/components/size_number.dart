import 'package:flutter/material.dart';

class SizeNumber extends StatelessWidget {
  final int size;
  const SizeNumber({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 70,
      decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: Colors.grey))),
      child: Center(
          child: Text('$size',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
    );
  }
}
