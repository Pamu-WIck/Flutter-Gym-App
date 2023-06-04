import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_compare_slider/image_compare_slider.dart';

class imgCompare extends StatelessWidget {
  final String itemTwoImagePath;
  final String userId;

  const imgCompare({Key? key, required this.itemTwoImagePath, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getImageUrl(userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String itemOneImagePath = snapshot.data!;

          return Card(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  width: constraints.maxWidth,
                  height: 250,
                  child: ImageCompareSlider(
                    dividerWidth: 2,
                    itemOne: Image.network(itemOneImagePath, width: 300),
                    itemTwo: Image(image: AssetImage(itemTwoImagePath), width: 300),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error loading image');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<String> getImageUrl(String userId) async {
    final ref = FirebaseStorage.instance.ref('uploads/$userId/1.jpg');
    return await ref.getDownloadURL();
  }
}
