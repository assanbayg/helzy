import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';
import '../widgets/analyse_list_tile.dart';

class AnalysesScreen extends StatelessWidget {
  static const routeName = '/analyses';

  const AnalysesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(
        theme: theme,
        title: 'My Analyses',
      ),
      body: Column(
        children: [
          Column(
            children: const [
              AnalyseListTile(
                icon: Icon(Icons.camera),
                title: 'Take a photo',
              ),
              AnalyseListTile(
                icon: Icon(Icons.photo),
                title: 'Choose from gallery',
              ),
              AnalyseListTile(
                icon: Icon(Icons.edit_note_rounded),
                title: 'Enter',
              ),
            ],
          ),
          const SizedBox(height: 25),
          Icon(
            Icons.picture_as_pdf,
            color: Colors.pink.shade50,
            size: 250,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add analyse'),
          )
        ],
      ),
    );
  }
}
