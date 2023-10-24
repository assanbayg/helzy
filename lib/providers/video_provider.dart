import 'package:flutter/material.dart';
import 'package:helzy/models/video.dart';

// Probably going to work with Google Storage or amazon s3 storage
class Videos with ChangeNotifier {
  final List<Video> _videos = [
    Video(
      title: 'Why is meditation important?',
      price: 12,
      description:
          'Meditation can wipe away the day\'s stress, bringing with it inner peace. See why learning to meditate is important to you.',
    ),
    Video(
      title: 'Morning meditation for the day',
      price: 34,
      description: '',
    ),
  ];

  List<Video> get videos => [..._videos];
}
