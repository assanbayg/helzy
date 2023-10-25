import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helzy/models/article.dart';

class ArticlesService {
  final CollectionReference articlesCollection =
      FirebaseFirestore.instance.collection('articles');

  Future<List<Article>> getArticles() async {
    try {
      final querySnapshot = await articlesCollection.get();
      return _extractArticlesFromSnapshot(querySnapshot);
    } catch (e) {
      log('Error in getArticles: $e');
      return [];
    }
  }

  List<Article> _extractArticlesFromSnapshot(QuerySnapshot querySnapshot) {
    final articles = <Article>[];
    for (final doc in querySnapshot.docs) {
      final title = doc['title'] ?? '';
      final text = doc['text'] ?? '';
      final price = doc['price'] ?? 0;

      final article = Article(
        title: title,
        text: text,
        price: price,
      );

      articles.add(article);
    }
    return articles;
  }
}
