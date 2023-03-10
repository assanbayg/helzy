import 'package:flutter/material.dart';

import '../../widgets/buy_item.dart';

class Meditation extends StatelessWidget {
  static const routeName = '/meditation';
  const Meditation({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Meditation', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  children: const [
                    BuyItem(
                      title: 'Why is meditation important?',
                      price: 14,
                      isContent: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
