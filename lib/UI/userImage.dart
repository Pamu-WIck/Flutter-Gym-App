import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Upload Image'),
      onPressed: () async {
        final User? user = auth.currentUser;

        // Check if user is signed in
        if (user == null) {
          print('No user signed in!');
          return;
        }

        try {
          // Load the image
          final byteData = await rootBundle.load('assets/images/1.jpg');
          final imageData = byteData.buffer.asUint8List();

          // Create a reference
          final ref = FirebaseStorage.instance.ref('uploads/${user.uid}/1.jpg');

          // Upload the image
          final taskSnapshot = await ref.putData(imageData);

          // Get the download URL
          final downloadUrl = await taskSnapshot.ref.getDownloadURL();

          print('Image uploaded: $downloadUrl');
        } catch (e) {
          print('Failed to upload image: $e');
        }
      },
    );
  }
}
