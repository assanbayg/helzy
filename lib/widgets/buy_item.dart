import 'package:flutter/material.dart';

class BuyItem extends StatelessWidget {
  final int price;
  final String title;
  final bool isContent;
  const BuyItem({
    super.key,
    required this.price,
    required this.title,
    required this.isContent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          isContent
              ? const Icon(
                  Icons.content_paste,
                  size: 100,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.video_call,
                  size: 100,
                  color: Colors.white,
                ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade200,
                          fixedSize: const Size(150, 50),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/heart-hands.png'),
                            const Text('Helzy'),
                          ],
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(price > 0 ? price.toString() : '0'),
                            SizedBox(
                              height: 20,
                              child: Image.asset('assets/images/star.png'),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
