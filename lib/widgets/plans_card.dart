import 'package:flutter/material.dart';

class PlansCard extends StatelessWidget {
  final String title;
  final String description;
  const PlansCard(
    this.title,
    this.description, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(right: 3),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 1, color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Column(children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.blueGrey)),
          Text(description, style: const TextStyle(color: Colors.blueGrey))
        ]),
      ),
    );
  }
}
