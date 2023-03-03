import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final ThemeData theme;
  final String title;
  const MyAppBar({
    super.key,
    required this.theme,
    required this.title,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.logo_dev),
      title: Text(title),
      backgroundColor: theme.primaryColor,
    );
  }
}
