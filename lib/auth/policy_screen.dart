import 'package:flutter/material.dart';
import '../navigation_bar.dart';
import '../widgets/logo_title.dart';

class PolicyScreen extends StatefulWidget {
  static const routeName = '/policy';
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
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
            const SizedBox(height: 125),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Privacy Policy', style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  const Text(
                      'We promise to keep your data safe, secure and confidental'),
                  const SizedBox(height: 20),
                  const Text(
                    'Please read our politics before creating an account',
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 1,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'I agree to the Privacy Policy Helzy',
                      ),
                      Switch(
                        value: val,
                        onChanged: ((value) {
                          val != value;
                        }),
                      ),
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
