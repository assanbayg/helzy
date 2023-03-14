import 'package:flutter/material.dart';

class Video {
  final String _title;
  final String description;
  int price;
  Video(this._title, this.price, this.description);

  String get title => _title;
}

class Videos with ChangeNotifier {
  final List<Video> _videos = [
    Video('Why is meditation important?', 12,
        'Meditation can wipe away the day\'s stress, bringing with it inner peace. See why learning to meditate is important to you.'),
    Video('Morning meditation for the day', 34, ''),
  ];

  List<Video> get videos => [..._videos];
}
