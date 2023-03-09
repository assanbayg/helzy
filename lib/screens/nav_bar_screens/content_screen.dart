import 'package:flutter/material.dart';

import '../../widgets/my_app_bar.dart';

class ContentScreen extends StatelessWidget {
  static const routeName = '/content';
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'My Content'),
      body: Column(),
    );
  }
}
