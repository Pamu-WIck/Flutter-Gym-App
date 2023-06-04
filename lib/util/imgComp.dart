import 'package:flutter/material.dart';
import 'package:image_compare_slider/image_compare_slider.dart';

class imgCompare extends StatelessWidget {
  final String itemOneImagePath;
  final String itemTwoImagePath;

  const imgCompare({Key? key, required this.itemOneImagePath, required this.itemTwoImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: constraints.maxWidth,
            height: 250,
            child: ImageCompareSlider(
              dividerWidth: 2,
              itemOne: Image(image: AssetImage(itemOneImagePath), width: 300),
              itemTwo: Image(image: AssetImage(itemTwoImagePath), width: 300),
            ),
          );
        },
      ),
    );
  }
}
