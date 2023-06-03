import 'package:flutter/material.dart';
import 'package:image_compare_slider/image_compare_slider.dart';

class imgCompare extends StatelessWidget {
  const imgCompare({Key? key}) : super(key: key);

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
              itemOne:
                  const Image(image: AssetImage('assets/images/1.jpg'), width: 300),
              itemTwo:
                  Image(image: AssetImage('assets/images/2.jpg'), width: 300),
            ),
          );
        },
      ),
    );
  }
}
