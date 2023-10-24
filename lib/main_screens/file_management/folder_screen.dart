// ignore_for_file: library_private_types_in_public_api
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:helzy/main_screens/file_management/image_view.dart';
import 'package:helzy/main_widgets/my_app_bar.dart';

class AddFilesToFolderScreen extends StatefulWidget {
  final String folderName;

  const AddFilesToFolderScreen({super.key, required this.folderName});

  @override
  _AddFilesToFolderScreenState createState() => _AddFilesToFolderScreenState();
}

class _AddFilesToFolderScreenState extends State<AddFilesToFolderScreen> {
  final List<String> _files = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.folderName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              child: const Row(
                children: [
                  Icon(Icons.add_rounded),
                  Text('Add'),
                ],
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    _files.add(result.files.single.path as String);
                  });
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Expanded(child: ImageView(files: _files)),
            ),
          ],
        ),
      ),
    );
  }
}
