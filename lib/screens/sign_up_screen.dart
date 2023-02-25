import 'package:flutter/material.dart';
import '../widgets/logo_title.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign up';
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
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
                Text('Please join us!', style: theme.textTheme.headlineSmall),
                const SizedBox(height: 20),
                const Text('Name'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.white,
                  child: const TextField(),
                ),
                const SizedBox(height: 10),
                const Text('Surname'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.white,
                  child: const TextField(),
                ),
                const SizedBox(height: 10),
                const Text('E-mail'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.white,
                  child: const TextField(),
                ),
                const SizedBox(height: 10),
                const Text('Password'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.white,
                  child: const TextField(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Sign in'),
          ),
        ]),
      ),
    );
  }
}
