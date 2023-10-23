// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:helzy/firebase/auth_services.dart';
import 'package:helzy/auth/policy_screen.dart';
import 'package:helzy/widgets/logo_title.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.1),
            child: Column(
              children: [
                const LogoTitle(),
                Text('Please join us!', style: theme.textTheme.headlineSmall),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.025),
                    const Text('Name'),
                    TextField(
                      controller: _nameController,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: size.height * 0.0125),
                    const Text('Surname'),
                    TextField(
                      controller: _surnameController,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: size.height * 0.0125),
                    const Text(
                      'E-mail',
                    ),
                    TextField(
                      controller: _emailController,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: size.height * 0.0125),
                    const Text('Password'),
                    TextField(
                      controller: _passwordController,
                      style: theme.textTheme.bodyMedium,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    SizedBox(height: size.height * 0.0125),
                    const Text('Date of birth: '),
                    TextButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: theme.primaryColor,
                                  onSurface: theme.primaryColor,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                      foregroundColor: theme.primaryColor),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            _dateInput.text = formattedDate;
                          });
                        }
                      },
                      child: Text(_dateInput.text == ""
                          ? 'DD/MM/YYYY'
                          : _dateInput.text),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: () async {
            final message = await AuthService().register(
              email: _emailController.text,
              password: _passwordController.text,
              name: _nameController.text,
              surname: _surnameController.text,
              dateOfBirth: _dateInput.text,
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
