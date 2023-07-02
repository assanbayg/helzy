import 'package:flutter/material.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.1,
          child: Image.asset('assets/images/heart-hands.png'),
        ),
        SizedBox(width: size.width * 0.0125),
        Text(
          'Helzy',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
