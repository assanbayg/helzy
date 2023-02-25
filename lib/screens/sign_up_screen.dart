import 'package:flutter/material.dart';
import '../widgets/logo_title.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        body: Column(children: [
          LogoTitle(),
          Text('Name'),
          TextField(),
          Text('Surname'),
          TextField(),
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
