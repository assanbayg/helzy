import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helzy/models/article.dart';

class ArticlesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('articles').get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        String title = doc['title'];
        String text = doc['text'];
        int price = doc['price'];
        final article = Article(
          title: title,
          text: text,
          price: price,
        );
        articles.add(article);
      }
    } catch (e) {
      print('Error fetching articles: $e');
    }
    return articles;
  }
  //example on how to use
  // void example() async {
  //   ArticlesService articlesService = ArticlesService();
  //   List<Article> articles = await articlesService.getArticles();

  //   for (Article article in articles) {
  //     print(article);
  //   }
  // }
}
