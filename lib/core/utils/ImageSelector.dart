import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../services/SupabaseStorageService.dart';

class ImageSelector {
  final ImagePicker _picker = ImagePicker();

  /// Picks an image from the gallery and uploads to Supabase.
  Future<String?> pickImageFromGallery() async {
    try {
      final XFile? xImage = await _picker.pickImage(source: ImageSource.gallery);
      if (xImage == null) {
        print("No image selected.");
        return null;
      }

      // Convert XFile to File
      final File imageFile = File(xImage.path);

      // Check file extension
      String fileExtension = path.extension(imageFile.path).toLowerCase();
      if (!(fileExtension == '.jpg' || fileExtension == '.jpeg' || fileExtension == '.png')) {
        fileExtension = '.jpg'; // Default to .jpg if the extension is not supported
      }

      return await _uploadToSupabase(imageFile, fileExtension);
    } catch (e) {
      print("Error picking and uploading image: $e");
      return null;
    }
  }

  /// Helper function to upload a file to Supabase.
  Future<String?> _uploadToSupabase(File file, String fileExtension) async {
    SupabaseStorageService storageService = SupabaseStorageService();

    final String? imageUrl = await storageService.uploadImageToBucket(
      "profile", // Replace with your bucket name
      file.path,
      fileExtension,
    );

    if (imageUrl != null) {
     // print("Image uploaded successfully: $imageUrl");
      return imageUrl;
    } else {
     // print("Failed to upload image.");
      return null;
    }
  }
}
