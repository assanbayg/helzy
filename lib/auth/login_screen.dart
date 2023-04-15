// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'auth_services.dart';
import '../navigation_bar.dart';
import '../widgets/logo_title.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  const Text(
                    'E-mail',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                final message = await AuthService().login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context)
                      .pushNamed(NavigationBarScreen.routeName);
                }
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
              child: const Text('Sign in'),
            ),
          ]),
        ),
      ),
    );
  }
}
