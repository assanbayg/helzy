import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:helzy/widgets/my_app_bar.dart';

import 'folder_screen.dart';
import 'create_folder.dart';

class AnalysesScreen extends StatefulWidget {
  @override
  _AnalysesScreenScreenState createState() => _AnalysesScreenScreenState();
}

class _AnalysesScreenScreenState extends State<AnalysesScreen> {
  List<String> _folders = ['Blood analyses'];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'My Analyses'),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final result = await showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200.0,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: SizedBox(
                              height: 30,
                              child:
                                  Image.asset('assets/images/folder_icon.png')),
                          title: Text('Create folder'),
                          onTap: () {
                            Navigator.pop(context, 'create_folder');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.attach_file),
                          title: Text('Add single file'),
                          onTap: () {
                            Navigator.pop(context, 'add_single_file');
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
              if (result == 'create_folder') {
                final folderName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateFolderScreen(),
                  ),
                );
                if (folderName != null) {
                  setState(() {
                    _folders.add(folderName);
                  });
                }
              } else if (result == 'add_single_file') {
                final result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    _folders.add(result.files.single.path as String);
                  });
                }
              }
            },
            child: Row(
              children: [
                Icon(Icons.add_rounded),
                Text('Create'),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: _folders.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddFilesToFolderScreen(
                          folderName: _folders[index],
                        ),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        _folders[index] = result;
                      });
                    }
                  },
                  child: ListTile(
                    leading: SizedBox(
                        height: 30,
                        child: Image.asset('assets/images/folder_icon.png')),
                    title: Text(
                      _folders[index],
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
