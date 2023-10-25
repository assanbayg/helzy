import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final Reference storageRef = FirebaseStorage.instance.ref();
  // still is not fixed
  Future<void> createBucket(String bucketName) async {
    final uid = 'test';
    try {
      final fileRef = storageRef.child("users/" + uid + "/file.filetype");
      log('Bucket "$bucketName" created.');
    } catch (e) {
      log('Error creating bucket: $e');
    }
  }

  Future<void> uploadFile(String filePath) async {
    try {
      File file = File(filePath);
      await storageRef.putFile(file);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> downloadFile(String path, String localPath) async {
    try {
      await storageRef.writeToFile(File(localPath));
    } catch (e) {
      log(e.toString());
    }
  }
}
