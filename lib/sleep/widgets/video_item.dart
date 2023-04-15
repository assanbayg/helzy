import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/helzy_star.dart';
import '../../providers/video.dart';
import '../screens/meditation_detail.dart';

// ignore: must_be_immutable
class VideoItem extends StatefulWidget {
  int index;
  VideoItem({super.key, required this.index});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  @override
  Widget build(BuildContext context) {
    Video video =
        Provider.of<Videos>(context, listen: false).videos[widget.index];
    int starsCount = Provider.of<HelzyStars>(context).starsCount;

    void buy() {
      if (starsCount < video.price) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Not enough to buy this item')));
      } else {
        setState(() {
          Provider.of<HelzyStars>(context, listen: false).starsCount -=
              video.price;
          video.price = 0;
        });
      }
    }

    void check() {
      if (video.price != 0) return;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              MeditationDetailScreen(index: widget.index)));
    }

    return GestureDetector(
      onTap: check,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
                height: 110, child: Image.asset('assets/images/video.png')),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    video.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Row(
                        children: [
                          Text(video.price.toString()),
                          SizedBox(
                            height: 20,
                            child: Image.asset('assets/images/star.png'),
                          ),
                        ],
                      ),
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
