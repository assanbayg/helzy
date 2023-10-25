import 'dart:io';
import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  final String filePath;

  const ImagePicker({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    File imageFile = File(filePath);
    if (!imageFile.existsSync()) {
      return const Text('Image not found');
    }
    return Image.file(imageFile);
  }
}
