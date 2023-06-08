import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_compare_slider/image_compare_slider.dart';


class imgCompare extends StatelessWidget {
  final String userId;

  Future<List<String?>> getImageUrls(String userId) async {
    final ref1 = FirebaseStorage.instance.ref('uploads/$userId/1.jpg');
    final ref2 = FirebaseStorage.instance.ref('uploads/$userId/2.jpg');
    final url1 = await ref1.getDownloadURL();
    final url2 = await ref2.getDownloadURL().catchError((error) {
      // Return the default image URL if the second image doesn't exist
      return FirebaseStorage.instance
          .ref('uploads/default/default.jpg')
          .getDownloadURL();
    });
    return [url1, url2];
  }

  const imgCompare({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String?>>(
      future: getImageUrls(userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<String?> imageUrls = snapshot.data!;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  width: constraints.maxWidth,
                  height: 348,
                  child: ImageCompareSlider(
                    dividerWidth: 2,
                    itemOne: Image.network(imageUrls[0]!, width: 500),
                    itemTwo: Image.network(imageUrls[1]!, width: 500),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error loading images');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
