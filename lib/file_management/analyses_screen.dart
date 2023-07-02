import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:helzy/widgets/my_app_bar.dart';

import 'package:helzy/file_management/folder_screen.dart';
import 'package:helzy/file_management/create_folder.dart'
    show CreateFolderScreen;

class AnalysesScreen extends StatefulWidget {
  const AnalysesScreen({super.key});
  static const routeName = '/nav-bar/analyses';

  @override
  State<AnalysesScreen> createState() => _AnalysesScreenState();
}

class _AnalysesScreenState extends State<AnalysesScreen> {
  final List<String> _folders = [];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'My Analyses'),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final result = await showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: size.height * 0.2,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: SizedBox(
                            height: size.height * 0.03,
                            child: Image.asset('assets/images/folder_icon.png'),
                          ),
                          title: const Text('Create folder'),
                          onTap: () => Navigator.pop(context, 'create_folder'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.attach_file),
                          title: const Text('Add single file'),
                          onTap: () =>
                              Navigator.pop(context, 'add_single_file'),
                        ),
                      ],
                    ),
                  );
                },
              );
              if (result == 'create_folder') {
                // ignore: use_build_context_synchronously
                final folderName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateFolderScreen(),
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
            child: const Row(
              children: [
                Icon(Icons.add_rounded),
                Text('Create'),
              ],
            ),
          ),
          _folders.isEmpty
              ? Text(
                  'No folders created yet!\nClick + Create',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                )
              : SizedBox(
                  height: size.height * 0.3,
                  child: ListView.builder(
                    itemCount: _folders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          if (_folders.isEmpty) return;

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
                            height: size.height * 0.03,
                            child: Image.asset('assets/images/folder_icon.png'),
                          ),
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
