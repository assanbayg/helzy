import 'package:flutter/material.dart';
import 'package:helzy/auth/auth_services.dart';
import 'package:helzy/navigation_bar.dart';
import 'package:helzy/widgets/logo_title.dart';

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
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LogoTitle(),
                  SizedBox(height: size.height * 0.025),
                  Text('Please sign in!', style: theme.textTheme.headlineSmall),
                  SizedBox(height: size.height * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email'),
                      TextField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Password'),
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: _passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.075),
            ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final scafMessenger = ScaffoldMessenger.of(context);
                final message = await AuthService().login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );

                if (message!.contains('Success')) {
                  navigator.pushNamed(NavigationBarScreen.routeName);
                }
                scafMessenger.showSnackBar(SnackBar(content: Text(message)));
              },
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
