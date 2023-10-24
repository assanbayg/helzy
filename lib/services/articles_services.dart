import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helzy/models/article.dart';

class ArticlesService {
  final CollectionReference articlesCollection =
      FirebaseFirestore.instance.collection('articles');

  Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    try {
      QuerySnapshot querySnapshot = await articlesCollection.get();
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
      print(e);
    }
    return articles;
  }
}
