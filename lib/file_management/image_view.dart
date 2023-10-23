import 'package:flutter/material.dart';

import 'image_picker.dart';

class ImageView extends StatefulWidget {
  final List<String> files;
  const ImageView({super.key, required this.files});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
        itemCount: widget.files.length,
        itemBuilder: (BuildContext context, int index) =>
            ImagePicker(filePath: widget.files[index]),
      ),
    );
  }
}
