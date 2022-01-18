import 'package:flutter/material.dart';

class IndicatorImages extends StatelessWidget {
  final int quantifyImages;
  final int imageSelected;
  const IndicatorImages({
    Key? key,
    required this.quantifyImages,
    required this.imageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 8,
      child: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: quantifyImages,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Container(
                    width: index == imageSelected ? 32 : 16,
                    decoration: BoxDecoration(
                        color: index == imageSelected
                            ? Colors.black
                            : Colors.black38,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
