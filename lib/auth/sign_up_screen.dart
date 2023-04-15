import 'package:flutter/material.dart';
import 'auth_services.dart';
import 'policy_screen.dart';
import '../widgets/logo_title.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Please join us!', style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  const Text('Name'),
                  const TextField(),
                  const SizedBox(height: 10),
                  const Text('Surname'),
                  const TextField(),
                  const SizedBox(height: 10),
                  const Text('E-mail'),
                  TextField(
                    controller: _emailController,
                  ),
                  const SizedBox(height: 10),
                  const Text('Password'),
                  TextField(
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  TextButton(onPressed: () {}, child: const Text('YY/MM/DD')),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: () async {
            final message = await AuthService().register(
              email: _emailController.text,
              password: _passwordController.text,
            );
            if (message!.contains('Success')) {
              Navigator.pushNamed(context, PolicyScreen.routeName);
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_forward_rounded,
          ),
        ),
      ),
    );
  }
}
