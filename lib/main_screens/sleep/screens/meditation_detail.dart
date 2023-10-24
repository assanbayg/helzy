import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/video.dart';
import '../../../main_widgets/my_app_bar.dart';

class MeditationDetailScreen extends StatelessWidget {
  final int index;
  const MeditationDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    Video video = Provider.of<Videos>(context).videos.elementAt(index);

    return Scaffold(
      appBar: ChildAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                video.title,
                style: theme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset('assets/images/player.png'),
              ),
              Text(video.description),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite_outlined,
                    color: Colors.red.shade400,
                    size: 40,
                  ),
                  const Text('Like'),
                ],
              ),
              const Row(
                children: [
                  Text('Write your opinion about this video!'),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey.shade400),
                        ),
                        const Text('Comment...'),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
