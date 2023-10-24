import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ThemeData theme;
  final String title;
  String text;

  MyAppBar({
    super.key,
    required this.theme,
    required this.title,
    this.text = '',
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: theme.textTheme.headlineMedium,
      ),
      elevation: 0,
      actions: [
        Row(
          children: [
            text == ''
                ? const Text('')
                : SizedBox(
                    height: 30,
                    child: Image.asset('assets/images/star.png'),
                  ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              child: Text(
                text,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }
}

class ChildAppBar extends StatelessWidget implements PreferredSizeWidget {
  ChildAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
    );
  }
}
