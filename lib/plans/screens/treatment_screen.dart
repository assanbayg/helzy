import 'package:flutter/material.dart';
import 'package:helzy/widgets/my_app_bar.dart';

class Treatment extends StatelessWidget {
  static const routeName = 'plans/treatment';
  const Treatment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
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
                      const Text(
                        'Write your\ntreatment',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                    ],
                  ),
                  TextFormField(),
                ],
              ),
              const SizedBox(
                height: 400,
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
