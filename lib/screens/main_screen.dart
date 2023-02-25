import 'package:flutter/material.dart';
import '../widgets/logo_title.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              Icon(
                Icons.logo_dev,
                size: 200,
              ),
              Text('Helzy', style: theme.textTheme.headlineLarge),
              Text(
                'Stay Helzy with us!',
                style: theme.textTheme.headlineSmall,
              ),
              Placeholder(),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Start'),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'I already have an account',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
