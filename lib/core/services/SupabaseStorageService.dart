import 'dart:io';
import 'package:FreeSkills/core/services/auth/UserLogin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as path;
class SupabaseStorageService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<String?> uploadImageToBucket(String bucketName, String filePath, String fileExtension) async {
    try {
      final File file = File(filePath);
      Userlogin ul = Userlogin();
      final String fileName = ul.getCurrentUserId().toString() + fileExtension;
      final String fileNameWithoutExtension = path.basenameWithoutExtension(fileName);
      // List all items in the bucket to check for file existence
      final List<FileObject> existingFiles = await supabase.storage.from(bucketName).list();

      // Check if the file already exists
      for (var fileObject in existingFiles) {
        final String existingFileNameWithoutExtension = path.basenameWithoutExtension(fileObject.name);
        if (existingFileNameWithoutExtension == fileNameWithoutExtension) { print("Removing existing file: ${fileObject.name}"); await supabase.storage.from(bucketName).remove([fileObject.name]); break; } }

      // Upload the new file
      await supabase.storage.from(bucketName).upload(fileName, file);

      // Get the public URL of the uploaded file
      final String publicUrl = supabase.storage.from(bucketName).getPublicUrl(fileName);
      print("File uploaded successfully: $publicUrl");

      return publicUrl;
    } catch (e) {
      print('Error uploading image to Supabase: $e');
      return null;
    }
  }
}
