import 'package:flutter/material.dart';

import '../../../widgets/my_app_bar.dart';

class Meditation extends StatelessWidget {
  static const routeName = '/meditation';
  const Meditation({super.key});

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
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            _buildAnalyseListTile(Icons.wb_twilight, 'Morning meditation'),
            _buildAnalyseListTile(
                Icons.energy_savings_leaf_outlined, 'Evening meditation'),
            _buildAnalyseListTile(Icons.nightlight, 'Sleep meditation'),
            _buildAnalyseListTile(Icons.abc, 'Graditude meditation'),
            _buildAnalyseListTile(Icons.abc, 'Self-awareness meditation'),
          ],
        ),
      ),
    );
  }
}
