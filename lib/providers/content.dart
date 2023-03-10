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
      'What is a diabetes? What are the symptoms?',
      13,
      'Most of the food we eat is turned into glucose, or sugar, for our bodies to use for energy. The pancreas, an organ that lies near the stomach, makes a hormone called insulin to help glucose get into the cells of our bodies.\n\nWhen you have diabetes, your body either doesn’t make enough insulin or can\’t use its own insulin as well as it should.\n\nThis causes sugars to build up in the blood. Diabetes can cause serious health complications including heart disease, blindness, kidney failure, and lower-extremity amputations.\n\nDiabetes is predicted by a clear set of symptoms, but it still often goes undiagnosed.\n\nThe main 3 diabetes signs are:\n  • Increased thirst\n  • Increased need to urinate\n  • Increased hunger',
      'assets/images/what-is-diabetes.png',
    ),
    Content(
      'Parkinson\'s diseases: new methods of treatment',
      0,
      'Nowadays – Parkinson’s disease is the second most common age-related neurological disease after Alzheimer’s and one of the most mysterious pathologies. The causes of Parkinson’s disease are still being studied, and the methods of treatment are being improved.\n\nTREATMENT OF PARKINSON’S DISEASE BY A NEW RANC METHOD\n\nOne of the modern methods of treating this neurological disease is the RANC (The Restoration Of The Activity Of Nerve Centers) method. Its main goal is to restore the activity of nerve centers.\nAfter the course of RANC procedures, the patient’s ability to control his own movements returns, the tremor in the limbs becomes lesser and eventually disappears.\n\nThe author of the RANC method is the Russian neurologist A.A Ponomarenko. He assumes that dopamine neurons (those that are responsible for the motor functions of a person) do not perish, but only as much as possible reduce their activity under the influence of certain factors and thus cease to perform their functions.\n\nTreatment of Parkinson’s disease by the RANC method involves the injection of 5% ANALGIN to the patient in all the painful areas of the trapezius muscles, as they correspond to the areas of the brain with impaired functions.\n\nA short pain from the procedure starts in the brain a process that restarts the work of dopamine neurons thus resume the production of dopamine.\nThe new RANC method quickly became popular in the treatment of Parkinson’s disease in Russia, as it shows good results in a short time – often patients are prescribed 2-3 procedures within 6 weeks.',
      'assets/images/parkinson.png',
    ),
    Content(
      'Can taking vitamin D supplements help prevent dementia?',
      30,
      '',
      '',
    ),
  ];

  List<Content> get contentList => [..._contentList];
}
