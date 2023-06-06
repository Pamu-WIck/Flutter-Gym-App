import 'package:flutter/material.dart';
import '../UI//home_page.dart';
import '../util/ImageUploader.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Upload Image'),
      onPressed: () async {
        await ImageUploader.uploadImage(1);

        // Navigate to HomePage after successful upload
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
  }
}
