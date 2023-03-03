import 'package:flutter/material.dart';

class AnalyseListTile extends StatelessWidget {
  final Icon icon;
  final String title;

  const AnalyseListTile({
    super.key,
    required this.icon,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
        ),
        //borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration:
              const BoxDecoration(border: Border(right: BorderSide(width: 1))),
          child: icon,
        ),
        title: Text(title),
        trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
        //tileColor: Colors.blue.shade200,
        hoverColor: Colors.blueGrey,
      ),
    );
  }
}
