import 'package:flutter/material.dart';
import 'package:helzy/models/video.dart';
import 'package:provider/provider.dart';

import '../../../providers/video_provider.dart';
import '../../../providers/helzy_star_provider.dart';
import '../../../main_widgets/my_app_bar.dart';
import '../widgets/video_item.dart';

class Meditation extends StatefulWidget {
  static const routeName = '/meditation';
  const Meditation({super.key});

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    List<Video> videos = Provider.of<Videos>(context).videos;
    int starsCount = Provider.of<HelzyStarsProvider>(context).starsCount;

    return SafeArea(
      child: Scaffold(
        appBar: const ChildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Meditation', style: theme.textTheme.headlineMedium),
                  Row(
                    children: [
                      Text('$starsCount',
                          style: theme.textTheme.headlineMedium),
                      SizedBox(
                          height: 35,
                          child: Image.asset('assets/images/star.png')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (BuildContext context, index) =>
                      VideoItem(index: index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
