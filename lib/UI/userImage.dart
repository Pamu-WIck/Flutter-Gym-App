import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../UI//home_page.dart';

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
          // Get image from gallery
          final pickedFile = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );

          if (pickedFile == null) {
            print('No image selected.');
            return;
          }

          // Load the image
          final File file = File(pickedFile.path);
          final imageData = await file.readAsBytes();

          // Create a reference
          final ref = FirebaseStorage.instance.ref('uploads/${user.uid}/1.jpg');

          // Upload the image
          final taskSnapshot = await ref.putData(imageData);

          // Get the download URL
          final downloadUrl = await taskSnapshot.ref.getDownloadURL();

          print('Image uploaded: $downloadUrl');

          // Navigate to HomePage after successful upload
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } catch (e) {
          print('Failed to upload image: $e');
        }
      },
    );
  }
}
