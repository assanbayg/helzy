import 'package:flutter/material.dart';
import '../../widgets/star_floating_action_button.dart';
import '../../widgets/my_app_bar.dart' show ChildAppBar;

class WaterScreen extends StatefulWidget {
  static const routeName = 'nutrition/water';
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<String> waterTimes = ['14:00', '16:00', '18:00'];
    List<bool> todayTimes = [false, false, false];
    List<bool> yesterdayTimes = [false, false, false];

    void addNewTime(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return SimpleDialog(
              title: const Text('Add a new time'),
              children: [
                const TextField(),
                SimpleDialogOption(
                  onPressed: () {},
                  child: const Text(
                    'Enter',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: ChildAppBar(),
      body: Stack(children: [
        Positioned(
          bottom: 60,
          left: 80,
          child: Image.asset('assets/images/water.png',
              opacity: const AlwaysStoppedAnimation(0.5)),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Water',
                style: theme.textTheme.headlineLarge,
              ),
              Text(
                'Today',
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                    itemCount: waterTimes.length,
                    itemBuilder: (BuildContext context, index) => Row(
                          children: [
                            Checkbox(
                                value: todayTimes[index],
                                onChanged: (val) => val != val),
                            Text(waterTimes[index]),
                          ],
                        )),
              ),
              Text(
                'Yesterday',
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                    itemCount: waterTimes.length,
                    itemBuilder: (BuildContext context, index) => Row(
                          children: [
                            Checkbox(
                                value: yesterdayTimes[index],
                                onChanged: (val) => val != val),
                            Text(waterTimes[index]),
                          ],
                        )),
              ),
              TextButton(
                  onPressed: () => addNewTime(context),
                  // () {
                  //   _showDialog();
                  //   setState(() {
                  //     waterTimes.add('23:00');
                  //     todayTimes.add(false);
                  //     yesterdayTimes.add(false);
                  //   });
                  // },
                  child: Row(
                    children: const [
                      Icon(Icons.add_rounded),
                      Text(
                        'Add',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ]),
      floatingActionButton: const StarFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
