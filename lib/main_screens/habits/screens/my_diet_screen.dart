import 'package:flutter/material.dart';
import '../../../main_widgets/my_app_bar.dart';

class MyDietScreen extends StatelessWidget {
  static const routeName = '/nutrition/my-diet';
  const MyDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: ChildAppBar(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Diet', style: theme.textTheme.headlineMedium),
            Text('Breakfast', style: theme.textTheme.headlineSmall),
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.add_rounded,
                          color: Colors.black,
                        ),
                        Text(
                          'Add',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.check_circle,
                            ),
                            Text(
                              'Cereal porridge',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        const Text(
                          '200 kcal',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.check_circle,
                            ),
                            Text(
                              'Green Tea',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        const Text(
                          '34 kcal',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ]),
            ),
            Text('Dinner', style: theme.textTheme.headlineSmall),
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.add_rounded,
                          color: Colors.black,
                        ),
                        Text(
                          'Add',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.check_circle,
                            ),
                            Text(
                              'Rise',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        const Text(
                          '260 kcal',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.check_circle,
                            ),
                            Text(
                              'Vegetables',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        const Text(
                          '104 kcal',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ]),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(Icons.add_rounded, size: 30),
                  Text(
                    'Add',
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Row(
                  children: const [
                    Icon(
                      Icons.add_rounded,
                      color: Colors.black,
                    ),
                    Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final int count;
  final Map<String, int> food;
  const FoodCard({super.key, required this.count, required this.food});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.add_rounded,
                      color: Colors.black,
                    ),
                    Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                  return Row(
                    children: [
                      Text(
                        food.keys.iterator.current,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
