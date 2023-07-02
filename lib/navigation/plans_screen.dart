import 'package:flutter/material.dart';
import 'package:helzy/plans/screens/notifications_screen.dart';
import 'package:helzy/plans/screens/treatment_screen.dart';
import 'package:helzy/plans/widgets/doctor_card.dart';
import 'package:helzy/plans/widgets/plan_card.dart';
import 'package:helzy/plans/widgets/plans_bms.dart';

import '../widgets/my_app_bar.dart';

class PlansScreen extends StatefulWidget {
  static const routeName = '/plans';
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  List<Map<String, String>> doctors = [
    {'name': 'Adele Bekmukhanova', 'field': 'Dentistry'},
    {'name': 'Aidar Muslimkhan', 'field': 'Neurology'},
  ];

  // ignore: unused_element
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MyAppBar(
        theme: theme,
        title: 'My Plans',
      ),
      body: Padding(
        padding: EdgeInsets.all(size.height / 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanCard(
              title: 'Treatment',
              editedText: 'edited last week',
              onTap: () => Navigator.pushNamed(context, Treatment.routeName),
            ),
            PlanCard(
              title: 'Notifications',
              editedText: 'edited last week',
              onTap: () =>
                  Navigator.pushNamed(context, NotificationsScreen.routeName),
            ),
            SizedBox(
              height: size.height / 5,
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (BuildContext context, int index) {
                  return DoctorCard(
                    name: doctors[index]['name']!,
                    field: doctors[index]['field']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
