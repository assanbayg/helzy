import 'package:flutter/material.dart';

class Video {
  final String _title;
  int price;
  Video(this._title, this.price);

  String get title => _title;
}

class Videos with ChangeNotifier {
  final List<Video> _videos = [
    Video('Why is meditation important?', 14),
    Video('Morning meditation for the day', 0),
  ];

  List<Video> get videos => [..._videos];
}
