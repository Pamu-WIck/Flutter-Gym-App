import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img; // Import the image package

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
      img.Image originalImage = img.decodeImage(await file.readAsBytes())!;

      // Calculate the size for cropping
      int originX = (originalImage.width - originalImage.height) ~/ 2;
      int originY = (originalImage.height - originalImage.width) ~/ 2;
      int size = originalImage.width < originalImage.height ? originalImage.width : originalImage.height;

      // Crop the image to a 1:1 aspect ratio
      img.Image croppedImage = img.copyCrop(originalImage, originX, originY, size, size);

      // Convert the cropped image back to a File
      final croppedFile = File(pickedFile.path)..writeAsBytesSync(img.encodeJpg(croppedImage));

      // Load the cropped image
      final imageData = await croppedFile.readAsBytes();

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
