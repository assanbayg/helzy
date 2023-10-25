import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/helzy_star_provider.dart';
import '../../../main_widgets/my_app_bar.dart';

class HelzyStarsScreen extends StatefulWidget {
  static const routeName = '/sleep/star/my-stars';
  const HelzyStarsScreen({super.key});

  @override
  State<HelzyStarsScreen> createState() => _HelzyStarsScreenState();
}

class _HelzyStarsScreenState extends State<HelzyStarsScreen> {
  @override
  Widget build(BuildContext context) {
    int waterCount = Provider.of<HelzyStarsProvider>(context).waterCount;
    int sleepCount = Provider.of<HelzyStarsProvider>(context).sleepCount;
    int starsCount = Provider.of<HelzyStarsProvider>(context).starsCount;

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: const ChildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/star.png'),
                    Text(
                      'Your Stars: $starsCount',
                      style: theme.textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your achievements:',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Text(
                    'Sleep: $sleepCount\nWater: $waterCount',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
