import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'policy_screen.dart';
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
                  const TextField(),
                  const SizedBox(height: 10),
                  const Text('Password'),
                  const TextField(),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1923, 1, 1),
                            maxTime: DateTime.now(),
                            onChanged: (date) {},
                            onConfirm: (date) {},
                            currentTime: DateTime.now(),
                            locale: LocaleType.en);
                      },
                      child: const Text('YY/MM/DD')),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: () => Navigator.pushNamed(context, PolicyScreen.routeName),
          child: const Icon(
            Icons.arrow_forward_rounded,
          ),
        ),
      ),
    );
  }
}
