import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.logo_dev),
      title: const Text('Helzy'),
      backgroundColor: theme.primaryColor,
    );
  }
}
