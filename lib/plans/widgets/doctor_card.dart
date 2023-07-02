import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.name,
    required this.field,
  });

  final String name;
  final String field;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(size.height / 160),
      margin: EdgeInsets.only(bottom: size.height / 80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(
            Icons.account_circle_rounded,
            size: size.height / 20,
            color: Colors.grey,
          ),
          SizedBox(width: size.height / 80),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(field, style: const TextStyle(color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
