import 'package:flutter/material.dart';
import './navigation_bar.dart';
import '../widgets/logo_title.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool val = false;
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextField(),
                  ),
                  const SizedBox(height: 10),
                  const Text('Surname'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextField(),
                  ),
                  const SizedBox(height: 10),
                  const Text('E-mail'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextField(),
                  ),
                  const SizedBox(height: 10),
                  const Text('Password'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextField(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'We promise to keep your data safe, secure and confidential. Please read our politics before creating an account',
                    style: TextStyle(
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                        value: val,
                        onChanged: ((value) {
                          val != value;
                        }),
                      ),
                      const Text('I agree'),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NavigationBarScreen.routeName);
              },
              child: const Text('Create an account'),
            ),
          ]),
        ),
      ),
    );
  }
}
