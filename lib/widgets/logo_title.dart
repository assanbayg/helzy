import 'package:flutter/material.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 80, child: Image.asset('assets/images/heart-hands.png')),
        const SizedBox(width: 10),
        Text(
          'Helzy',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
