import 'package:flutter/material.dart';

class HelzyStarsScreen extends StatefulWidget {
  static const routeName = '/sleep/star/my-stars';
  const HelzyStarsScreen({super.key});

  @override
  State<HelzyStarsScreen> createState() => _HelzyStarsScreenState();
}

class _HelzyStarsScreenState extends State<HelzyStarsScreen> {
  int _starsCount = 37;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar:
          AppBar(backgroundColor: theme.scaffoldBackgroundColor, elevation: 0),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset('assets/images/star.png'),
                Text(
                  'Your Stars: $_starsCount',
                  style: theme.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Text('Your achievements'),
        ],
      ),
    );
  }
}
