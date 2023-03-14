import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:helzy/widgets/my_app_bar.dart';

class AddFilesToFolderScreen extends StatefulWidget {
  final String folderName;

  AddFilesToFolderScreen({required this.folderName});

  @override
  _AddFilesToFolderScreenState createState() => _AddFilesToFolderScreenState();
}

class _AddFilesToFolderScreenState extends State<AddFilesToFolderScreen> {
  List<String> _files = [];

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
              child: Row(
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
            Expanded(
              child: ListView.builder(
                itemCount: _files.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      _files[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
