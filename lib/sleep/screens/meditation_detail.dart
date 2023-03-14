import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/video.dart';
import '../../widgets/my_app_bar.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
