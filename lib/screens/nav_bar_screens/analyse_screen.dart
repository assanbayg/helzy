import 'package:flutter/material.dart';

import '../../widgets/my_app_bar.dart';

class AnalysesScreen extends StatelessWidget {
  static const routeName = '/analyses';

  const AnalysesScreen({super.key});

  Widget _buildAnalyseListTile(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
      //tileColor: Colors.blue.shade200,
      hoverColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(
        theme: theme,
        title: 'My Analyses',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    builder: (BuildContext ctx) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 233, 129, 142),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30))),
                            child: Column(children: [
                              Text(
                                'Add analyses',
                                style: theme.textTheme.headlineSmall,
                              )
                            ]),
                          ),
                          _buildAnalyseListTile(
                            Icons.add_a_photo_rounded,
                            'Take a photo',
                          ),
                          _buildAnalyseListTile(
                            Icons.photo,
                            'Choose from gallery',
                          ),
                          _buildAnalyseListTile(
                            Icons.picture_as_pdf,
                            'Impact a pdf',
                          ),
                          _buildAnalyseListTile(
                            Icons.edit_note_rounded,
                            'Enter manually',
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: const [
                  Icon(Icons.add_rounded),
                  SizedBox(width: 15),
                  Text('Add analyses'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.asset('assets/images/folder_icon.png'),
                  ),
                  const SizedBox(width: 15),
                  const Text('Folders'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.asset(
                        'assets/images/testing_notification_icon.png'),
                  ),
                  const SizedBox(width: 15),
                  const Text('Testing Notifications'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
