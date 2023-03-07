import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';
import '../widgets/analyse_list_tile.dart';

class Meditation extends StatelessWidget {
  static const routeName = '/meditation';
  const Meditation({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(theme: theme, title: 'Meditation'),
        body: Column(
          children: const [
            AnalyseListTile(
                icon: Icon(Icons.wb_twilight), title: 'Morning meditation'),
            AnalyseListTile(
                icon: Icon(Icons.energy_savings_leaf_outlined),
                title: 'Evening meditation'),
            AnalyseListTile(
                icon: Icon(Icons.nightlight), title: 'Sleep meditation'),
            AnalyseListTile(
                icon: Icon(Icons.abc), title: 'Graditude meditation'),
            AnalyseListTile(
                icon: Icon(Icons.abc), title: 'Self-awareness meditation'),
          ],
        ),
      ),
    );
  }
}
