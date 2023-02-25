import 'package:flutter/material.dart';
import 'package:helzy/widgets/logo_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        body: Column(children: [
          LogoTitle(),
          Text('Please sign in!'),
          Text('E-mail'),
          TextField(),
          Text('Password'),
          TextField(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Sign in'),
          ),
        ]),
      ),
    );
  }
}
