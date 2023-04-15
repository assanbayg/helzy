import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  final String title;
  const DiaryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const TextField(),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
