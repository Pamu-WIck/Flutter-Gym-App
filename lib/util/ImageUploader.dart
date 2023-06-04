import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploader {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> uploadImage(int fileNumber) async {
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
      final ref = FirebaseStorage.instance.ref('uploads/${user.uid}/$fileNumber.jpg');

      // Upload the image
      final taskSnapshot = await ref.putData(imageData);

      // Get the download URL
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();

      print('Image uploaded: $downloadUrl');
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }
}
