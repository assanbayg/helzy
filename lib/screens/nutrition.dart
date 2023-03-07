import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';

class Nutrition extends StatelessWidget {
  static const routeName = '/nutrition';

  const Nutrition({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(theme: theme, title: 'Nutrition'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: mediaQuery.size.width * 0.75,
                    height: mediaQuery.size.height * 0.25,
                    color: Colors.white,
                  ),
                  Text(
                    'Menu',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Breakfast',
                    style: theme.textTheme.headlineSmall,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
