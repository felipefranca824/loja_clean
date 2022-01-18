import 'package:flutter/material.dart';

class ButtonAdd extends StatefulWidget {
  const ButtonAdd({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonAdd> createState() => _ButtonAddState();
}

class _ButtonAddState extends State<ButtonAdd> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.linear,
        height: 35,
        width: 35,
        child: Container(
          decoration: const BoxDecoration(
              //color: Color.fromRGBO(44, 46, 51, 100),
              color: Colors.black87,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
