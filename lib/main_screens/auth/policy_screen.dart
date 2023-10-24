import 'package:flutter/material.dart';
import '../../main_widgets/navigation_bar.dart';
import '../../main_widgets/logo_title.dart';

class PolicyScreen extends StatefulWidget {
  static const routeName = '/policy';
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    bool isAgreed = false;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: const LogoTitle(),
              ),
              Text('Privacy Policy', style: theme.textTheme.headlineSmall),
              SizedBox(height: size.height / 50),
              const Text(
                  'We promise to keep your data safe, secure and confidental'),
              SizedBox(height: size.height / 50),
              const Text('Please read our politics before creating an account'),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height / 50),
                width: size.width * 0.75,
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
                    value: isAgreed,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(NavigationBarScreen.routeName);
                },
                child: const Text('Create an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
