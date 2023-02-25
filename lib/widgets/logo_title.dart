import 'package:flutter/material.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.logo_dev,
          size: 80,
        ),
        Text(
          'Helzy',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
