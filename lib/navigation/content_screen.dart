import 'package:flutter/material.dart';

import '../widgets/buy_item.dart';
import '../widgets/my_app_bar.dart';

class ContentScreen extends StatelessWidget {
  static const routeName = '/content';
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'My Content'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              //SearchInput
              controller: TextEditingController(),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Column(
                children: const [
                  BuyItem(
                    title: 'What is Diabetes?',
                    price: 14,
                    isContent: true,
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
