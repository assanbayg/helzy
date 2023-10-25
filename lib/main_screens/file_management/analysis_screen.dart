import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:helzy/main_screens/file_management/screens/create_folder_screen.dart';
import 'package:helzy/main_screens/file_management/widgets/folders_view.dart';
import 'package:helzy/main_screens/file_management/widgets/image_view.dart';
import 'package:helzy/services/storage_service.dart';
import 'package:helzy/main_widgets/my_app_bar.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  static const routeName = '/nav-bar/analysis';

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final List<String> folders = [];
  final List<String> files = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    Future<void> createFolder() async {
      final folderName = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateFolderScreen()),
      );

      if (folderName != null) {
        setState(() {
          folders.add(folderName);
        });
      }
    }

    Future<void> addSingleFile() async {
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        StorageService().uploadFile(result.files.single.path as String);
        setState(() {
          files.add(result.files.single.path as String);
        });
      }
    }

    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'My Analysis'),
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
                createFolder();
              } else if (result == 'add_single_file') {
                addSingleFile();
              }
            },
            child: const Row(
              children: [
                Icon(Icons.add_rounded),
                Text('Create'),
              ],
            ),
          ),
          if (folders.isEmpty && files.isEmpty)
            Text(
              'No folders created yet!\nClick + Create',
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            )
          else
            Expanded(
              child: Column(
                children: [
                  if (files.isNotEmpty)
                    ImageView(files: files)
                  else
                    const SizedBox.shrink(),
                  FoldersView(folders: folders),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
