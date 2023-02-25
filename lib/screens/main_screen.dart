import 'package:flutter/material.dart';
import './login_screen.dart';
import './sign_up_screen.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';
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
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: const Text('Start'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
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
