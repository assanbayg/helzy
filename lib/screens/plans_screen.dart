import 'package:flutter/material.dart';
import 'package:helzy/screens/notifications_screen.dart';
import 'package:helzy/widgets/plans_bms.dart';

import '../widgets/my_app_bar.dart';

class PlansScreen extends StatefulWidget {
  static const routeName = '/plans';
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  void _showModalBottomSheet(String title) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return PlanBottomModalSheet(title: title);
        });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(
        theme: theme,
        title: 'My Plans',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                      height: 30,
                      child: Image.asset('assets/images/folder_icon.png')),
                  const SizedBox(width: 15),
                  const Text(
                    'Treatment',
                  ),
                ],
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    _showModalBottomSheet('medication');
                  },
                  child: const Text(
                    'Medication',
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, NotificationsScreen.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                      height: 30,
                      child: Image.asset(
                          'assets/images/testing_notification_icon.png')),
                  const SizedBox(width: 15),
                  const Text(
                    'Notifications',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
