import 'package:flutter/material.dart';
import '/star_screen.dart';

class StarFloatingActionButton extends StatelessWidget {
  const StarFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, StarScreen.routeName);
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Image.asset('assets/images/star.png'),
    );
  }
}
