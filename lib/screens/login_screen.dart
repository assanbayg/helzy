import 'package:flutter/material.dart';

import './navigation_bar.dart';
import '../widgets/logo_title.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  icon: const Icon(Icons.west_rounded),
                ),
                const SizedBox(
                  width: 55,
                ),
                const LogoTitle(),
              ],
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Please sign in!', style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  const Text('E-mail'),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: const TextField()),
                  const SizedBox(height: 10),
                  const Text('Password'),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: const TextField()),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NavigationBarScreen.routeName);
              },
              child: const Text('Sign in'),
            ),
          ]),
        ),
      ),
    );
  }
}
