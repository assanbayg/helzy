import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:helzy/widgets/my_app_bar.dart';

class StepsScreen extends StatelessWidget {
  static const routeName = 'habits/steps';
  const StepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: ChildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Steps',
              style: theme.textTheme.headlineMedium,
            ),
            Text(
              'Today',
              style: theme.textTheme.headlineSmall,
            ),
            Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1500',
                    style: theme.textTheme.headlineLarge,
                  ),
                  Text(
                    'Goal: 6000',
                    style: theme.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(188, 228, 220, 1),
                        ),
                        child: Image.asset('assets/images/time.png')),
                    SizedBox(height: 10),
                    Text('0h 47 min')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(188, 228, 220, 1),
                      ),
                      child: Image.asset('assets/images/fire.png'),
                    ),
                    SizedBox(height: 10),
                    Text('75 kcal')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(188, 228, 220, 1),
                      ),
                      child: Image.asset('assets/images/location.png'),
                    ),
                    SizedBox(height: 10),
                    Text('1.05 km')
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Week', style: theme.textTheme.headlineSmall),
                Text('Total steps: 16 874\nAverage: 5410'),
                SizedBox(height: 20),
                Text('Month', style: theme.textTheme.headlineSmall),
                Text('Total steps: 71 931\nAverage: 3521'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
