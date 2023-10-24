import 'package:flutter/material.dart';
import 'sleep/screens/my_stars_screen.dart';

class StarScreen extends StatelessWidget {
  static const routeName = '/sleep/star';
  const StarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/star.png'),
                Text(
                  'Hey!\nMy name is Helzy Star',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/bubble.png',
                      color: Colors.pink.shade200,
                    ),
                    const Positioned(
                      width: 200,
                      top: 35,
                      left: 25,
                      child: Text(
                        'For every goal you completeyou get 1 Helzy Star.Having collected the right amount, you can exchange them for the interesting medications and useful articles in the content section',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, HelzyStarsScreen.routeName),
                  child: const Text('See my Helzy Stars'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
