import 'package:flutter/material.dart';

class Content {
  String _title;
  int price;
  String _text;
  String _imageUrl;

  Content(this._title, this.price, this._text, this._imageUrl);

  String get title => _title;
  String get text => _text;
  String get imageUrl => _imageUrl;
}

class ContentList with ChangeNotifier {
  final List<Content> _contentList = [
    Content(
      'What is a diabetes and what is its symtomps?',
      14,
      'Most of the food we eat is turned into glucose, or sugar, for our bodies to use for energy. The pancreas, an organ that lies near the stomach, makes a hormone called insulin to help glucose get into the cells of our bodies.\nWhen you have diabetes, your body either doesn’t make enough insulin or can\’t use its own insulin as well as it should.\nThis causes sugars to build up in the blood. Diabetes can cause serious health complications including heart disease, blindness, kidney failure, and lower-extremity amputations.\nDiabetes is predicted by a clear set of symptoms, but it still often goes undiagnosed.\nThe main 3 diabetes signs are:\n• Increased thirst\n• Increased need to urinate\n• Increased hunger',
      'assets/images/what-is-diabetes.png',
    ),
    Content(
      'Parkinson\'s diseases: new methods of treatment',
      0,
      '',
      'assets/images/what-is-diabetes.png',
    ),
  ];

  List<Content> get contentList => [..._contentList];
}
