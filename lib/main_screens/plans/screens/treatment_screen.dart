import 'package:flutter/material.dart';
import 'package:helzy/main_widgets/my_app_bar.dart';

class TreatmentScreen extends StatelessWidget {
  static const routeName = 'plans/treatment';
  const TreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: ChildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 20),
        child: Container(
          padding: EdgeInsets.all(size.height / 40),
          width: double.infinity,
          height: size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/treatment.png'),
                      Text(
                        'Write your\ntreatment',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  TextFormField(),
                ],
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.grey),
                    ),
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
