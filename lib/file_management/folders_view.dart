import 'package:flutter/material.dart';
import 'package:helzy/file_management/folder_screen.dart';

class FoldersView extends StatefulWidget {
  final List<String> folders;
  const FoldersView({super.key, required this.folders});

  @override
  State<FoldersView> createState() => _FoldersViewState();
}

class _FoldersViewState extends State<FoldersView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
        itemCount: widget.folders.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddFilesToFolderScreen(
                    folderName: widget.folders[index],
                  ),
                ),
              );
              if (result != null) {
                setState(() {
                  widget.folders[index] = result;
                });
              }
            },
            child: ListTile(
              leading: SizedBox(
                height: size.height * 0.03,
                child: Image.asset('assets/images/folder_icon.png'),
              ),
              title: Text(
                widget.folders[index],
                style: theme.textTheme.bodyMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
