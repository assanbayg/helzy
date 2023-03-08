import 'package:flutter/material.dart';

class PlanBottomModalSheet extends StatelessWidget {
  final String title;

  const PlanBottomModalSheet({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 129, 142),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: Column(children: [
            Text(
              'My ${title}s',
              style: theme.textTheme.headlineSmall,
            )
          ]),
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                ),
                Text('Adding $title', style: const TextStyle(color: Colors.black)),
              ],
            )),
      ],
    );
  }
}
