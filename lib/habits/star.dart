import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  const Star({super.key});

  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  bool on = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          on != on;
        });
      },
      child: on == true
          ? const Icon(
              Icons.star_outline,
              size: 30,
              color: Colors.yellow,
            )
          : const Icon(
              Icons.star,
              size: 50,
              color: Colors.yellow,
            ),
    );
  }
}
