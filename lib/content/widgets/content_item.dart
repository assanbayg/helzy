import 'package:flutter/material.dart';
import 'package:helzy/content/screens/content_detail.dart';
import 'package:provider/provider.dart';

import 'package:helzy/providers/content.dart';
import 'package:helzy/providers/helzy_star.dart';

class ContentBuyItem extends StatefulWidget {
  final int index;
  const ContentBuyItem({super.key, required this.index});

  @override
  State<ContentBuyItem> createState() => _ContentBuyItemState();
}

class _ContentBuyItemState extends State<ContentBuyItem> {
  @override
  Widget build(BuildContext context) {
    Content content = Provider.of<ContentList>(context, listen: false)
        .contentList[widget.index];
    int starsCount = Provider.of<HelzyStars>(context).starsCount;

    void buy() {
      if (starsCount < content.price) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Not enough to buy this item')));
      } else {
        setState(() {
          Provider.of<HelzyStars>(context, listen: false).starsCount -=
              content.price;
          content.price = 0;
        });
      }
    }

    void check() {
      if (content.price != 0) return;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              ContentDetailScreen(index: widget.index)));
    }

    return GestureDetector(
      onTap: check,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
                height: 110, child: Image.asset('assets/images/content.png')),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: buy,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade200,
                            fixedSize: const Size(130, 45),
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
                              Text(content.price > 0
                                  ? content.price.toString()
                                  : '0'),
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
      ),
    );
  }
}
