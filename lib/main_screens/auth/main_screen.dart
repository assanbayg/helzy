import 'package:flutter/material.dart';
import 'package:helzy/langs/app_localizations.dart';
//auth related imports
import 'package:helzy/main_screens/auth/login_screen.dart';
import 'package:helzy/main_screens/auth/sign_up_screen.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Helzy', style: theme.textTheme.headlineLarge),
              Text(
                AppLocalizations.of(context)!.translate('motto')!,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: Image.asset('assets/images/heart-hands.png'),
              ),
              SizedBox(height: size.height * 0.025),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(SignUpScreen.routeName),
                child: Text(AppLocalizations.of(context)!.translate('start')!),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(LoginScreen.routeName),
                style: theme.textButtonTheme.style,
                child: Text(
                  AppLocalizations.of(context)!.translate('haveAccount')!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
