import 'package:flutter/material.dart';
import 'package:helzy/models/article.dart';
import 'package:helzy/services/articles_service.dart';

class ArticlesProvider with ChangeNotifier {
  final ArticlesService _articlesService = ArticlesService();
  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Future<void> fetchArticles() async {
    print('HELO');
    try {
      final articles = await _articlesService.getArticles();
      _articles = articles;
      notifyListeners();
    } catch (e) {
      print("Error fetching articles: $e");
    }
  }

  // Old version!!!

  // final List<Article> _articlesList = [
  //   Article(
  //     title: 'What is a diabetes? What are the symptoms?',
  //     price: 13,
  //     text:
  //         'Most of the food we eat is turned into glucose, or sugar, for our bodies to use for energy. The pancreas, an organ that lies near the stomach, makes a hormone called insulin to help glucose get into the cells of our bodies.\n\nWhen you have diabetes, your body either doesn’t make enough insulin or can’t use its own insulin as well as it should.\n\nThis causes sugars to build up in the blood. Diabetes can cause serious health complications including heart disease, blindness, kidney failure, and lower-extremity amputations.\n\nDiabetes is predicted by a clear set of symptoms, but it still often goes undiagnosed.\n\nThe main 3 diabetes signs are:\n  • Increased thirst\n  • Increased need to urinate\n  • Increased hunger',
  //     imageUrl: 'assets/images/what-is-diabetes.png',
  //   ),
  //   Article(
  //     title: 'Parkinson\'s diseases: new methods of treatment',
  //     price: 0,
  //     text:
  //         'Nowadays – Parkinson’s disease is the second most common age-related neurological disease after Alzheimer’s and one of the most mysterious pathologies. The causes of Parkinson’s disease are still being studied, and the methods of treatment are being improved.\n\nTREATMENT OF PARKINSON’S DISEASE BY A NEW RANC METHOD\n\nOne of the modern methods of treating this neurological disease is the RANC (The Restoration Of The Activity Of Nerve Centers) method. Its main goal is to restore the activity of nerve centers.\nAfter the course of RANC procedures, the patient’s ability to control his own movements returns, the tremor in the limbs becomes lesser and eventually disappears.\n\nThe author of the RANC method is the Russian neurologist A.A Ponomarenko. He assumes that dopamine neurons (those that are responsible for the motor functions of a person) do not perish, but only as much as possible reduce their activity under the influence of certain factors and thus cease to perform their functions.\n\nTreatment of Parkinson’s disease by the RANC method involves the injection of 5% ANALGIN to the patient in all the painful areas of the trapezius muscles, as they correspond to the areas of the brain with impaired functions.\n\nA short pain from the procedure starts in the brain a process that restarts the work of dopamine neurons thus resume the production of dopamine.\nThe new RANC method quickly became popular in the treatment of Parkinson’s disease in Russia, as it shows good results in a short time – often patients are prescribed 2-3 procedures within 6 weeks.',
  //     imageUrl: 'assets/images/parkinson.png',
  //   ),
  // ];

  // List<Article> get articlesList => [..._articlesList];
}
