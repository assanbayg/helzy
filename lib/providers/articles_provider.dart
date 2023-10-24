import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helzy/models/article.dart';
import 'package:helzy/services/articles_service.dart';

class ArticlesProvider with ChangeNotifier {
  final ArticlesService _articlesService = ArticlesService();
  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Future<void> fetchArticles() async {
    try {
      final articles = await _articlesService.getArticles();
      _articles = articles;
      notifyListeners();
    } catch (e) {
      log("Error fetching articles: $e");
    }
  }
}
