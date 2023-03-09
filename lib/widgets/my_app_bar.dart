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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      leading: SizedBox(
          height: 15, child: Image.asset('assets/images/heart-hands.png')),
      title: Text(
        title,
      ),
      backgroundColor: theme.primaryColor,
    );
  }
}
