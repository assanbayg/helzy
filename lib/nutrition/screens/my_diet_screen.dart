import 'package:flutter/material.dart';
import '../../widgets/my_app_bar.dart';

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
            Text('Dinner', style: theme.textTheme.headlineSmall),
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
    return Stack(
      children: [
        Container(
          width: double.infinity,
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
                    Icon(Icons.add_rounded),
                    Text('Add'),
                  ],
                ),
              ),
              ListView.builder(itemBuilder: (BuildContext context, index) {
                return Row(
                  children: [Text('data')],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
