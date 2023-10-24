//I am sure this doesn't work at all😃

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadFile(String filePath) async {
    try {
      File file = File(filePath);
      String fileName = filePath.split('/').last;
      final analysesRef = _storage.ref('test/$fileName');
      await analysesRef.putFile(file);
    } catch (e) {
      // handle error -> write later
    }
  }

  Future<void> downloadFile(String path, String localPath) async {
    try {
      final analysesRef = _storage.ref('analyses');
      await analysesRef.writeToFile(File(localPath));
    } catch (e) {
      // handle error -> write later
    }
  }
}
